FactoryGirl.define do
  factory :descending_dates_apt_entry, class: Appointment do |p|
    p.buyer_id 1
    p.consumer_id 2
    p.sequence(:day_of_month) {|n| Time.now - n.days}
  end

  factory :ascending_dates_apt_entry, class: Appointment do |p|
    p.buyer_id 1
    p.consumer_id 2
    p.sequence(:day_of_month) {|n| Time.now + n.days}
  end

  factory :std_apt_entry, class: Appointment do
    buyer_id 1
    consumer_id 2
    day_of_month Time.now
  end
end
