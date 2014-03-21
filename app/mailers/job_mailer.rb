class JobMailer < ActionMailer::Base
  default from: "jobs@mini-job.me"
 
  def job_applied_email(kid, job)
    @parent = kid.parent
    @url  = application_job_url(job)
    mail(to: @parent.email, subject: "#{kid.name} wants to apply for a job!")
  end
end
