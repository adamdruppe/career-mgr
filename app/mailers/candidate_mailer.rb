class CandidateMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  def invitation
    set_objects
    mail(to: @fellow.contact.email, subject: "You've been invited to apply for #{@opp.name}")
  end

  def researched_employer
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Research This Employer")
  end

  def connected_with_employees
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Connect with Current Employees")
  end

  def customized_application_materials
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Customized Your Application Materials")
  end

  def submitted_application
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Submit Your Application")
  end

  def followed_up_after_application_submission
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Follow Up on Your Application")
  end

  def scheduled_an_interview
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Schedule an Interview")
  end

  def researched_interview_process
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Research the Interview Process")
  end

  def practiced_for_interview
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Practice for Your Interview")
  end

  def attended_interview
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Ace Your Interview!")
  end

  def followed_up_after_interview
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Follow Up After Your Interview")
  end

  def received_offer
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: Look for an Offer!")
  end
  
  private
  
  def set_objects
    @token = params[:access_token]
    @fellow_opp = @token.owner
    @fellow = @fellow_opp.fellow
    @opp = @fellow_opp.opportunity
  end
end
