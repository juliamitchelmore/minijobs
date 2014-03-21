class JobMailer < ActionMailer::Base
  default from: "jobs@mini-job.me"
 
  # kid has applied for a job,
  # parent can view job listing and decide to approve from there
  def job_applied_email(kid, job)
    @parent = kid.parent
    @url  = job_url(job)
    mail(to: @parent.email, subject: "#{kid.name} wants to apply for a job!")
  end

  # parent is allowing kid to apply for job,
  # lister can see kid's profile and decide to accept the application
  def job_parent_accepted_email(parent, job)
    @kid = parent.kids.first
    @url  = kid_url(@kid)
    @lister = job.lister
    mail(to: @lister.email, subject: "#{kid.name} has applied for a job!")
  end

  # lister has accepted application,
  # parent can contact lister directly
  def job_lister_accepted_email(lister, kid, job)
    @job = job
    @lister = lister
    @parent = kid.parent
    mail(to: @parent.email, subject: "#{kid.name}'s application has been accepted!")
  end
end
