class Mutharaiyar::MembersController < ApplicationController
 
  skip_before_filter :authenticate_user!, :only => [:index, :search]

  def index
  	@locations = Location.order("name")
  end  

  def new
    @locations = Location.order("name")
    @companies = Company.order("name")
    @member = Member.new
  end
   def search
    @results = Member.where("1=1")
    @results = @results.where(["location_id = ?", params[:id]]) if !params[:id].blank?
    render :layout => false
  end
  def create
     if params[:member][:company_id]
    @company = Company.new(params[:company])
    if @company.save
      @company_address = Address.create(params[:compaddress].merge(addr_type:"Company",addr_id:@company.id))
    end
    end
  	@member = !params[:company_id].blank? ? Member.new(params[:member].merge(:company_id=>@company.id)) : Member.new(params[:member])
  	if @member.save
      @address = Address.create(params[:address].merge(addr_type:"Member",addr_id:@member.id))
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
