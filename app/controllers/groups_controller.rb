class GroupsController < ApplicationController

	def index
		@user = User.find(session[:user_id])
		@groups = Group.all
		

	end

	def create
		group = Group.create(group_params)

		if group.valid?
			return redirect_to groups_path
		else	
			flash[:errors] = group.errors.full_messages
			return redirect_to groups_path
		end
	end

	def show
		@group = Group.find(params[:id])
		@members = @group.users_added
		
	end

	def delete
		delete = User.find(session[:user_id]).groups.find(params[:group_id]).destroy
		return redirect_to groups_path
	end



	private

		def group_params
			params.require(:group).permit(:title, :description).merge(user: current_user)
		end

end

