FactoryGirl.define do

  factory :tom_hanks, class: User do
    name 'Tom Hanks'
    twitter 'https://twitter.com/tomhanks'
    facebook 'https://www.facebook.com/TomHanks'
    linkedin "https://www.linkedin.com/in/noHanksLINK_=("
  end

  factory :user_list, class: User do |u|
    u.sequence(:name) {|n| "lunchDateUserTester#{n}"}
    u.sequence(:twitter) {|n| "https://twitter.com/lunchDateUserTester#{n}"}
    u.sequence(:facebook) {|n| "https://www.facebook.com/lunchDateUserTester#{n}"}
    u.sequence(:linkedin) {|n| "https://www.linkedin.com/in/lunchDateUserTester#{n}"}
  end
end
