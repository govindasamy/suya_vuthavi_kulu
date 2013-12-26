class UsersController < ApplicationController

  def index
  end  

  def list

    # raise @users[0].inspect
    @groups = Group.order("name")
    @users = User.order("first_name")
  end	

  def edit
  	@user = User.find(params[:id])
    @groups = Group.order("name")
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(params[:user])
      @user.account.update_attributes(:name => @user.full_name)
      groups_users_ids = []
      for group_id in params[:slected].keys
        if eval(params[:slected][group_id][:groups])
          groups_user = GroupsUser.find_or_initialize_by_user_id_and_group_id(@user.id, group_id)
          groups_users_ids << groups_user.id if groups_user.save 
        end  
      end
      GroupsUser.destroy_all(["id not in(?) and user_id = ?", groups_users_ids, @user.id])
  	  flash[:notice] = "User was saved"	
  	  redirect_to list_users_path
  	else
  	  flash[:notice] = "User was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
    redirect_to users_path
  end
  def search
    @users = User.joins(:groups_users).select("users.*")
    @users = @users.where(["first_name like ? or last_name like ?", "%#{params[:search][:first_name]}%", "%#{params[:search][:first_name]}%"]) if !params[:search][:first_name].blank?
    @users = @users.where(:groups_users => {:group_id => params[:search][:group_id]}) if !params[:search][:group_id].blank?
    #   flash[:notice] = "SEARCH RESULT NOT FOUND" 
    #   redirect_to list_users_path
    # end
  end  
end

