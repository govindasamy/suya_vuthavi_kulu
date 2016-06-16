class Mutharaiyar::LocationTransactionsController < ApplicationController
 
  def index
  	@location_transactions = LocationTransaction.order("name")
  end  

  def new
    @locations = Location.order("name")
    @members = Member.order("name")
    @location_transaction = LocationTransaction.new
  end

  def create
  	@location_transaction = LocationTransaction.new(params[:transaction])
  	if @location_transaction.save
  	  flash[:notice] = "location_transaction was saved"	
  	  redirect_to mutharaiyar_members_path
  	else
      @locations = LocationTransaction.order("name")
  	  flash[:notice] = "member was not saved"	
  	  render :action => :new
  	end 
  end

  def edit
  	@member = LocationTransaction.find(params[:id])
  end

  def update
  	@member = LocationTransaction.find(params[:id])
  	if @member.update_attributes(params[:member])
  	  flash[:notice] = "member was saved"	
  	  redirect_to mutharaiyar_members_path
  	else
  	  flash[:notice] = "member was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@member = LocationTransaction.find(params[:id])
  	@member.destroy
  	redirect_to mutharaiyar_members_path
  end

end
