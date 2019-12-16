class JobsUsersController < ApplicationController
  before_action :check_current_user, only: [:new, :create, :edit, :update, :destroy]

  def index
  	@jobs_user = JobsUser.all
  end

  def applyform
  	@jobs_user = JobsUser.new
  end

  def create
    @jobs = Job.find(params[:job_id])
  	@jobs_user = @jobs.jobs_users.create(params_jobs_user)
  	if @jobs_user.save
  		flash[:success] = "Success Apply Jobs"
  		redirect_to jobs_path
  	else
      flash[:error] = "Failed to Aplly"
      redirect_back fallback_location: "0.0.0.0:3000/jobs"
  	end
  end

  def accepted
    jobs_user = JobsUser.find_by_id(params[:id])
    if jobs_user.try(:update,{status: "accepted"})
      flash[:notice] = "Applyment was Accepted"
      redirect_back fallback_location: "0.0.0.0:3000/jobs_users"
      else
        flash[:error] = "Action Failed"
        redirect_back fallback_location: "0.0.0.0:3000/jobs_users"
      end
  end

  def rejected
    jobs_user = JobsUser.find_by_id(params[:id])
    if jobs_user.try(:update,{status: "rejected"})
      flash[:notice] = "Applyment was Rejected"
      redirect_back fallback_location: "0.0.0.0:3000/jobs_users"
      else
        flash[:error] = "Action Failed"
        redirect_back fallback_location: "0.0.0.0:3000/jobs_users"
      end
  end

  def destroy
  	@jobs_user = JobsUser.find_by_id(params[:id])
  	@jobs_user.destroy
  	redirect_to jobs_users_path
  	flash[:notice] = "Applyment was deleted!"
  end

  private
      def params_jobs_user
      params.require(:jobs_user).permit(:status, :job_id, :user_id, :cover_letter, :attachment)
   end
end
