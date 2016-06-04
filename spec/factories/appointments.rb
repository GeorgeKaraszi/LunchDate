FactoryGirl.define do

  factory :user1, class: User do
    name 'user1'
    twitter 'https://twitter.com/user1'
    facebook 'https://www.facebook.com/user1'
    linkedin "https://www.linkedin.com/in/user1"
  end

  factory :user2, class: User do
    name 'user2'
    twitter 'https://twitter.com/user2'
    facebook 'https://www.facebook.com/user2'
    linkedin "https://www.linkedin.com/in/user2"
  end

  factory :descending_dates_apt_entry, class: Appointment do |p|
    p.buyer FactoryGirl.create(:user1)
    p.consumer FactoryGirl.create(:user2)
    p.sequence(:day_of_month) {|n| Date.today - n.days}
  end


  factory :ascending_dates_apt_entry, class: Appointment do |p|
    p.buyer FactoryGirl.create(:user1)
    p.consumer FactoryGirl.create(:user2)
    p.sequence(:day_of_month) {|n| Date.today  + n.days}
  end

  factory :std_apt_entry, class: Appointment do |p|
    p.buyer FactoryGirl.create(:user1)
    p.consumer FactoryGirl.create(:user2)
    p.day_of_month Date.today
  end
end
