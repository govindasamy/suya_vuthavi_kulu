class DonationsController < ApplicationController
 
  def index
  	@donations = Donation.order("name")
  end  

  def new
    @donation = Donation.new
  end

  def create
  	@donation = Donation.create_donation(params[:donation])
  	if @donation
  	  flash[:notice] = "Donation was saved"	
  	  redirect_to donations_path
  	else
  	  flash[:notice] = "Donation was not saved"	
  	  render :action => :new
  	end 
  end

  def edit
  	@donation = Donation.find(params[:id])
  end

  def update
  	@donation = Donation.find(params[:id])
  	if @donation.update_attributes(params[:donation])
  	  flash[:notice] = "Donation was saved"	
  	  redirect_to donations_path
  	else
  	  flash[:notice] = "Donation was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@donation = Donation.find(params[:id])
  	@donation.destroy
  	redirect_to donations_path
  end

end
