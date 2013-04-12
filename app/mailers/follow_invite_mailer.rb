class FollowInviteMailer < ActionMailer::Base
  helper :mailer

  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.follow_invite_mailer.invite.subject
  #
  def invite(inviter, invitee)
    @inviter = inviter
    @invitee = invitee

    mail to: @invitee.email, subject: "Your To Do App Invitation"
  end
end
