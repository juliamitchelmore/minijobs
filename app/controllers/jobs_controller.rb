class JobsController < ApplicationController
  before_filter :require_adult, except: [:show]
  before_filter :require_kid, only: [:show]

  # FOR KIDS
  def apply_for_job
    job = Job.find(params[:id])
    job.status = 'applied'
    job.save
    current_user.jobs << job
    redirect_to me_path
    # JobMailer.job_applied_email(current_user, job)
  end

  # FOR PARENTS
  def accept_job
    # verify token...
    job = Job.find(params[:id])
    job.status = 'parent accepted'
    job.save
    redirect_to me_path
    # JobMailer.job_parent_accepted_email(current_user, job)
  end

  # FOR LISTERS
  def accept_application
    job = Job.find(params[:id])
    kid = Kid.find(params[:kid_id])
    job.status = 'application accepted'
    job.save
    redirect_to me_path
    # JobMailer.job_lister_accepted_email(current_user, kid, job)
  end

  # GET /jobs
  # GET /jobs.json
  # FOR KIDS
  def index
    @distance = 3
    listers = Adult.near(current_user.lat_long, @distance, units: :km)
    @jobs = listers.map(&:jobs).flatten.uniq

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])
    @job.status = 'listed'

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end

  private
  def require_adult
    current_user.is_a? Adult
  end
end
