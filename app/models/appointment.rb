class Appointment < ActiveRecord::Base
  belongs_to :buyer, :class_name => 'User', :foreign_key => 'buyer_id'
  belongs_to :consumer, :class_name => 'User', :foreign_key => 'consumer_id'
  validates_presence_of :buyer, :consumer, :day_of_month
  validates_uniqueness_of :day_of_month
  validate :check_buyer_frequency

  #
  # Checks to see if the buyer has paid less then 3 times within a months time
  ###############################################################################

  def check_buyer_frequency
    month_ago = (self.day_of_month - 1.month)
    frequency = Appointment
                    .where(['day_of_month > ? AND day_of_month <= ?', month_ago, self.day_of_month])
                    .where(:buyer => self.buyer).count

    errors.add(:buyer, "#{:buyer} has paid to many times this month") unless frequency < 3

  end

  #
  # Builds a new appointment from two users on a given date
###############################################################################
  def self.build_appointment(date = Date.today, users = get_buyer_consumer)
    if users == :OutOfOptions
      return users
    else
      Appointment.new({buyer:users[0], consumer:users[1], day_of_month:date})
    end
  end

  #
  # Creates a new appointment based on a given date, or returns nil if exists
  ###############################################################################
  def self.create_appointment(date = Date.today)
    unless Appointment.exists?(day_of_month: date)
      appointment = build_appointment(date)
      return appointment if appointment == :OutOfOptions
      return appointment if appointment.save
    end
  end

  #
  # Gets appointment based on a given date, or returns nil if does not exist
  ###############################################################################
  def self.get_appointment(date = Date.today)
    if Appointment.exists?(day_of_month: date)
      Appointment.find_by_day_of_month(date)
    end
  end

  # SELECT *
  #     FROM users
  # left join appointments on appointments.buyer_id = users.id
  # and (day_of_month > '2016-05-10' AND day_of_month <= '2016-06-10')
  # group by appointments.buyer_id
  # having COUNT(appointments.buyer_id) < 3;

  #
  # Returns a list of buyers who cannot buy this month
  ###############################################################################
  def self.not_available_buyers(date = Date.today)
    month_ago = (date - 1.month).to_s(:db)
    ret = Appointment
             .where(['day_of_month > ? AND day_of_month <= ?', month_ago, date])
             .group('buyer_id')
             .having('COUNT(buyer_id) >= 3')

    ret.inject([]) {|arr, buyer| arr << buyer.buyer_id}
  end

  #
  # Returns a buyer and consumer array
  ###############################################################################
  def self.get_buyer_consumer(date = Date.today)
    reject_list = not_available_buyers(date)
    buyer = nil

    if reject_list.length
      buyer = User.where.not(id: reject_list).sample(1).first
    else
      buyer = User.sample(1).first
    end
    consumer = User.where.not(id: buyer.id).sample(1).first unless buyer.nil?

    return [buyer,consumer] unless buyer.nil? && consumer.nil?
    return :OutOfOptions
  end

end
