class JobsController < ApplicationController
	 before_action :check_current_user, only: [:new, :create, :edit, :update, :destroy]

	def index
		@job = Job.page(params[:page]).per(10)
		respond_to do |format|
			if params[:search].present?
	  			format.js {
	  				@job = Job.where("title_job like ? or desc_job like ?", "%#{params[:search]}%","%#{params[:search]}%").page(params[:page]).per(2)
	  			}
	  			format.html
	  		else
	  			format.html
	  		end
	  	end
	end

	def new
		@job = Job.new
	end

	def show
    	@jobs = Job.find_by_id(params[:id])
		@jobs_user = JobsUser.new
	end

	def edit
		@job = Job.find_by_id(params[:id])
	end

	def destroy
		@job = job.find_by_id(params[:id])
		if @job.destroy
			flash[:success] = "Success Delete a Records"
			redirect_to action: 'index'
		else
			flash[:error] = "Fails Delete a Records"
			redirect_to action: 'index'
		end
	end

	def update
		@job = Job.find_by_id(params[:id])
		if @job.update(params_job)
			flash[:succes] = "Success Update Records"
			redirect_to action: 'index'
		else
			flash[:error] = "data not valid"
			render 'edit'
		end
	end

	def create
		@job = Job.new(params_job)
		if @job.save
			flash[:success] ="Susccess Add Records"
  			redirect_to action: 'index'
  		else
  			flash[:error] = "Data not Valid"
  			render 'new'
  		end
  	end

  	private
  	def params_job
  		params.require(:job).permit(:title_job, :desc_job, :status)
  	end
end
