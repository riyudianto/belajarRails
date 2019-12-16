class UsersController < ApplicationController
	def index
		@user = User.all
	end

	def new
		@user = User.new
	end

	def list_applyment
		@user = JobsUser.find_by_user_id(params[:user_id])
	end

	def edit
	end

	def create
		@user = User.new(params_user)
	    if @user.save
	        flash[:notice] = "Registration Success"
	        redirect_to root_url
	    else
	        flash[:error] = "data not valid"
	        render "new"
	    end
	  end

	  private
	  def params_user
	    params.require(:user).permit(:name, :username, :email, :age, :password, :password_confirmation, :humanizer_answer, :humanizer_question_id)
	  end
end
