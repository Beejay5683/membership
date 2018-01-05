class MembersController < ApplicationController

	def create
		add = Member.create(member_params)

		if add.valid?
			flash[:message] = 'Member successfully added to Group!'
			return redirect_to :back
		else	
			flash[:errors] = add.errors.full_messages
			return redirect_to groups_show_path
		end
	end

	def delete
		delete = Group.find(params[:group_id]).members.find_by(user_id:session[:user_id]).destroy
		return redirect_to groups_show_path

	end

	private
		def member_params
			params.require(:member).permit(:group_id).merge(user_id: session[:user_id])
		end
end
