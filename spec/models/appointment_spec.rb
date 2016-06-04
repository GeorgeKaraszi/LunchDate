require 'rails_helper'

RSpec.describe Appointment, type: :model do

  describe '.check_payer_frequency' do
    let (:appointments) {build_list(:descending_dates_apt_entry, 3)}
    let (:apt_overflow) {build_list(:descending_dates_apt_entry, 4)}

    it 'successfully allows the user to pay' do
      expect(appointments.all? {|e| e.save}).to eq(true)
    end

    it 'disallows the user from paying more' do
      expect(apt_overflow.all? {|e| e.save}).to eq(false)
    end

    it 'allows the user to pay again after a month' do
      apt_overflow.first.day_of_month += 1.month
      expect(apt_overflow.all? {|e| e.save}).to eq(true)
    end


  end

  describe '.create_appointment' do
    subject (:appointment) {Appointment.create_appointment}

    it "creates an appoint for today's date" do
      create_list(:user_list, 5)
      expect(appointment.day_of_month).to eq(Date.today)
    end

    it 'returns nil if date already exists' do
      create(:std_apt_entry)
      expect(Appointment.create_appointment).to eq(nil)
    end
  end

  describe '.get_appointment' do
    before do
      create_list(:user_list, 5)
    end
    subject (:appointment) {Appointment.get_appointment}

    it "returns the appointments date" do
      Appointment.create_appointment
      expect(appointment.day_of_month).to eq(Date.today)
    end

    it 'returns a joined table buyers name' do
      Appointment.create_appointment
      expect(appointment.buyer.name).to_not eq(nil)
    end

    it 'returns a joined table consumer name' do
      Appointment.create_appointment
      expect(appointment.consumer.name).to_not eq(nil)
    end

    it 'returns nil if date does not exists' do
      expect(appointment).to eq(nil)
    end
  end
end
