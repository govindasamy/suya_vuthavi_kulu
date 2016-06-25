class Mutharaiyar::MembersController < ApplicationController
 
  def index
  	@members = Member.order("name")
  end  

  def new
    @locations = Location.order("name")
    @member = Member.new
  end
   def search
    @results = Member.where("1=1")
    @results = @results.where(["id = ?", params[:id]]) if !params[:id].blank?
    render :layout => false
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
    @locations = Location.order("name")
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
