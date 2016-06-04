# Preview all emails at http://localhost:3000/rails/mailers/lunch_date
class LunchDatePreview < ActionMailer::Preview

  def lunch_date_mailer_preview()
    LunchDate.lunch_date_mailer
  end

  def lunch_date_error_preview()
    LunchDate.lunch_date_error(Date.today)
  end

end
