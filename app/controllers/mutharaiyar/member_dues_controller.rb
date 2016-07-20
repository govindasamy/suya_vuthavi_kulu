class Mutharaiyar::MemberDuesController < ApplicationController
 
  #skip_before_filter :authenticate_user!, :only => [:index, :search]

  def index
  	@locations = Location.order("name")
  end  

  def new
    @locations = Location.order("name")
    @members = Member.order("name")
    @member_due = MemberDue.new
  end
   def search
    @results = MemberDue.where("1=1")
    @results = @results.where(["location_id = ?", params[:id]]) if !params[:id].blank?
    render :layout => false
  end
  def create
  	@member_due = MemberDue.new(params[:member_due])
  	if @member_due.save
  	  flash[:notice] = "member_due was saved"	
  	  redirect_to mutharaiyar_member_dues_path
  	else
      @locations = Location.order("name")
      @members = Member.order("name")
  	  flash[:notice] = "member_due was not saved"	
  	  render :action => :new
  	end 
  end

  def edit
    @locations = Location.order("name")
    @members = Member.order("name")
  	@member_due = member_due.find(params[:id])
  end

  def update
  	@member_due = member_due.find(params[:id])
  	if @member_due.update_attributes(params[:member_due])
  	  flash[:notice] = "member_due was saved"	
  	  redirect_to mutharaiyar_member_dues_path
  	else
  	  flash[:notice] = "member_due was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@member_due = member_due.find(params[:id])
  	@member_due.destroy
  	redirect_to mutharaiyar_member_dues_path
  end

end
