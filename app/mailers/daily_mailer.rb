class DailyMailer < ActionMailer::Base
  default from: "maxwellgmiller@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_mailer.items_remaining.subject
  #
  def daily_update(user)
    @recently_completed = user.list.items.recently_completed
    @uncompleted = user.list.items.uncompleted

    mail to: user.email, subject: "Your Happy Fun Daily Tasks Update"
  end
end
