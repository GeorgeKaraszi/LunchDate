class LunchDate < ApplicationMailer

  def lunch_date_mailer(date = Date.today)
    @appointment = Appointment.create_appointment(date)
    @appointment ||= Appointment.get_appointment(date)

    if @appointment == :OutOfOptions
      lunch_date_error(date)
    else
      mail(to: 'everyone@elevatorup.com', subject: 'Lunch Date On ' + date.to_s)
    end

  end

  def lunch_date_error(date)
    mail(to:'everyone@elevatorup.com', subject: 'No Lunch Date available On ' + date.to_s)
  end

end
