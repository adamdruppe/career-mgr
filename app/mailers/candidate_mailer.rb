class CandidateMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  def respond_to_invitation
    set_objects
    mail(to: @fellow.contact.email, subject: "You've been invited to apply for #{@opp.name}")
  end

  def research_employer
    nag("Research This Employer")
  end

  def connect_with_employees
    nag("Connect with Current Employees")
  end

  def customize_application_materials
    nag("Customize Your Application Materials")
  end

  def submit_application
    nag("Submit Your Application")
  end

  def follow_up_after_application
    nag("Follow Up on Your Application")
  end

  def schedule_interview
    nag("Schedule an Interview")
  end

  def research_interview_process
    nag("Research the Interview Process")
  end

  def practice_for_interview
    nag("Practice for Your Interview")
  end

  def attend_interview
    nag("Ace Your Interview!")
  end

  def follow_up_after_interview
    nag("Follow Up After Your Interview")
  end

  def receive_offer
    nag("Look for an Offer!")
  end

  def submit_counter_offer
    nag("Consider a Counter Offer")
  end

  def accept_offer
    nag("Accept Your Offer!")
  end
  
  private
  
  def nag subject
    set_objects
    mail(to: @fellow.contact.email, subject: "#{@opp.name}: #{subject}")
  end
  
  def set_objects
    @token = params[:access_token]
    @fellow_opp = @token.owner
    @fellow = @fellow_opp.fellow
    @opp = @fellow_opp.opportunity
  end
end
