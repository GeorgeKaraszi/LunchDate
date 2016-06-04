class LunchDate < ApplicationMailer

  def lunch_date_mailer(date = Date.today)
    @appointment = Appointment.create_appointment(date)
    @appointment ||= Appointment.get_appointment(date)

    mail(to: 'tester@test.com', subject: 'Lunch Date On ' + date.to_s)

  end

end
