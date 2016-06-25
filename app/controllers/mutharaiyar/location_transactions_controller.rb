class Mutharaiyar::LocationTransactionsController < ApplicationController
 
  def index
    @locations = Location.order("name")
  	@location_transactions = LocationTransaction.all
  end  
def show
end
  def new
    @locations = Location.order("name")
    @members = Member.order("name")
    @location_transaction = LocationTransaction.new
  end
   def search
    @results = LocationTransaction.where("1=1")
    @results = @results.where(["location_id = ?", params[:location_id]]) if !params[:location_id].blank?
    @results = @results.where(["member_id = ?", params[:member_id]]) if !params[:member_id].blank?
    @results = @results.where("date BETWEEN ? AND ?",params[:from_date].to_date,params[:to_date].to_date) if !params[:from_date].blank? && !params[:to_date].blank?
    render :layout => false
  end
  def create
  	@location_transaction = LocationTransaction.new(params[:location_transaction])
  	if @location_transaction.save
  	  flash[:notice] = "location transaction was saved"	
  	  redirect_to mutharaiyar_location_transactions_path
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
  	  redirect_to mutharaiyar_location_transactions_path
  	else
  	  flash[:notice] = "member was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@member = LocationTransaction.find(params[:id])
  	@member.destroy
  	redirect_to mutharaiyar_location_transactions_path
  end

end
