class ProjectMailer < ApplicationMailer
  default from: 'epiGenesys Team 10'

  def new_project_email(req)
    @requirement = req
    mail(subject: '[epiGenesys]Confirmation of your project',
         to: req.email, cc: 'genesys-team10@shefcompsci.org.uk')
  end

  def accept_project_email(req, user)
    @requirement = req
    @user = user
    mail(subject: '[epiGenesys]Your project has been accepted',
         to: req.email, cc: 'genesys-team10@shefcompsci.org.uk')
  end

  def suggest_project_email(req, user, address)
    @requirement = req
    @user = user

    mail(subject: '[epiGenesys]You have new suggestion',
         to: address)

  end
end
