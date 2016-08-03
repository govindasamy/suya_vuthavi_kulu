class Mutharaiyar::CompaniesController < ApplicationController
 
  skip_before_filter :authenticate_user!, :only => [:index, :search]

  def index
  	@company = Company.order("name")
  end  

  def new
    #@locations = Location.order("name")
    @company = Company.new
  end
   def search
    @results = Company.where("1=1")
    @results = @results.where(["location_id = ?", params[:id]]) if !params[:id].blank?
    render :layout => false
  end
  def create
  	@company = Company.new(params[:company])
   
  	if @company.save
       @address = Address.create(params[:address].merge(addr_type:"Company",addr_id:@company.id))
  	  flash[:notice] = "company was saved"	
  	  redirect_to mutharaiyar_companies_path
  	else
     # @locations = Location.order("name")
  	  flash[:notice] = "company was not saved"	
  	  render :action => :new
  	end 
  end

  def edit
   # @locations = Location.order("name")
  	@company = Company.find(params[:id])
  end

  def update
  	@company = company.find(params[:id])
  	if @company.update_attributes(params[:company])
  	  flash[:notice] = "company was saved"	
  	  redirect_to mutharaiyar_companys_path
  	else
  	  flash[:notice] = "company was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@company = company.find(params[:id])
  	@company.destroy
  	redirect_to mutharaiyar_companys_path
  end

end
