class Mutharaiyar::LocationsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:index, :search]

  def index
  	@locations = Location.order("name")
  end  

  def new
    @location = Location.new
  end
  def search
    @results = Location.where("1=1")
    @results = @results.where(["id = ?", params[:id]]) if !params[:id].blank?
    render :layout => false
  end
  def create
  	@location = Location.new(params[:location])
  	if @location.save
  	  flash[:notice] = "location was saved"	
  	  redirect_to mutharaiyar_locations_path
  	else
  	  flash[:notice] = "location was not saved"	
  	  render :action => :new
  	end 
  end

  def edit
  	@location = Location.find(params[:id])
  end

  def update
  	@location = Location.find(params[:id])
  	if @location.update_attributes(params[:location])
  	  flash[:notice] = "location was saved"	
  	  redirect_to mutharaiyar_locations_path
  	else
  	  flash[:notice] = "location was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@location = Location.find(params[:id])
  	@location.destroy
  	redirect_to mutharaiyar_locations_path
  end

end
