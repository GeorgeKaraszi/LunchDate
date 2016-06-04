class User < ActiveRecord::Base
  has_many :buyers, class_name: 'Appointment', :foreign_key => 'buyer_id'
  has_many :consumers, class_name: 'Appointment', :foreign_key => 'consumer_id'
  attr_accessor :twitter_profile
  validates_presence_of :name, :twitter, :facebook, :linkedin

  #
  # Randomly selects two users from the database
  ###############################################################################
  def self.select_two_users
    all.sample(2) unless all.length < 2
  end

  #
  # returns all users with their linked social media profiles
  ###############################################################################
  def self.all_profiles
    all.inject([]) do |arr, user|
      profile = get_twitter_profile(user)
      user.twitter_profile = profile unless profile == :NotFound
      arr << user
    end
  end


  private
  #
  # Extracts the user name from a given URL
  # (IE: http://twitter.com/myName) = myName
  # (IE: http://twitter.com/myName/somthing) = myName
  ###############################################################################
  def self.get_user_from_url(url)
    username = URI(url).path.match(/([^\\\/]+)/)
    username[0] unless username.nil?
  end

  #
  # Obtains the users profile information
  ###############################################################################
  def self.get_twitter_profile(user)
    @app_config ||= YAML.load_file(Rails.root.join('config', 'twitter.yml'))[Rails.env]
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = @app_config['CONSUMER_KEY']
      config.consumer_secret     = @app_config['CONSUMER_SECRET']
      config.access_token        = @app_config['ACCESS_TOKEN']
      config.access_token_secret = @app_config['ACCESS_SECRET']
    end

    user_name = get_user_from_url(user.twitter)
    @client.user(user_name) unless user_name.nil?

  rescue => e
    return :NotFound

  end

end
