class Mutharaiyar::MembersController < ApplicationController
 
  def index
  	@members = Member.order("name")
  end  

  def new
    @locations = Location.order("name")
    @member = Member.new
  end

  def create
  	@member = Member.new(params[:member])
  	if @member.save
  	  flash[:notice] = "member was saved"	
  	  redirect_to mutharaiyar_members_path
  	else
      @locations = Location.order("name")
  	  flash[:notice] = "member was not saved"	
  	  render :action => :new
  	end 
  end

  def edit
  	@member = Member.find(params[:id])
  end

  def update
  	@member = Member.find(params[:id])
  	if @member.update_attributes(params[:member])
  	  flash[:notice] = "member was saved"	
  	  redirect_to mutharaiyar_members_path
  	else
  	  flash[:notice] = "member was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@member = Member.find(params[:id])
  	@member.destroy
  	redirect_to mutharaiyar_members_path
  end

end
