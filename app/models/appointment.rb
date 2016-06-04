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
    today = Date.today

    if today >= self.day_of_month
      month_ago = today - 1.month
      frequency = Appointment
                      .where(['day_of_month > ? AND day_of_month <= ?', month_ago, today])
                      .where(:buyer => self.buyer).count
    else
      month_ago = (self.day_of_month - 1.month)
      frequency = Appointment
                      .where(['day_of_month > ? AND day_of_month <= ?', month_ago, self.day_of_month])
                      .where(:buyer => self.buyer).count
    end

    errors.add(:buyer, "#{:buyer} has paid to many times this month") unless frequency < 3

  end

  #
  # Builds a new appointment from two users on a given date
###############################################################################
  def self.build_appointment(date = Date.today, users = User.select_two_users)
    Appointment.new({buyer:users[0], consumer:users[1], day_of_month: date})
  end

  #
  # Creates a new appointment based on a given date, or returns nil if exists
  ###############################################################################
  def self.create_appointment(date = Date.today)
    unless Appointment.exists?(day_of_month: date)
      appointment = build_appointment(date)
      appointment if appointment.save
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

end
