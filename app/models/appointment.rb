class Appointment < ActiveRecord::Base
  belongs_to :buyer, :class_name => 'User', :foreign_key => 'buyer_id'
  belongs_to :consumer, :class_name => 'User', :foreign_key => 'user_id'
  validates_presence_of :buyer_id, :consumer_id, :day_of_month
  validates_uniqueness_of :day_of_month

end
