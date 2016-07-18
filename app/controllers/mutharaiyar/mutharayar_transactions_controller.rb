class Mutharaiyar::MutharayarTransactionsController < ApplicationController
 
  skip_before_filter :authenticate_user!, :only => [:index, :search]

  def index
    @locations = Location.order("name")
  	@mutharaiyar_transactions = MutharayarTransaction.all
  end  

  def new
    @locations = Location.order("name")
    @muth_transaction = MutharayarTransaction.new
  end

  def create
  	@muth_transaction = MutharayarTransaction.new(params[:mutharayar_transaction])
  	if @muth_transaction.save
  	  flash[:notice] = "muth_transaction was saved"	
  	  redirect_to mutharaiyar_mutharayar_transactions_path
  	else
      @locations = MutharayarTransaction.order("name")
  	  flash[:notice] = "member was not saved"	
  	  render :action => :new
  	end 
  end

  def search
    @results = MutharayarTransaction.where("1=1")
    @results = @results.where(["from_location_id = ? or to_location_id = ?", params[:from_location], params[:from_location]]) if !params[:from_location].blank?
    @results = @results.where("date BETWEEN ? AND ?",params[:from_date].to_date,params[:to_date].to_date) if !params[:from_date].blank? && !params[:to_date].blank?
    render :layout => false
  end

  def edit
  	@muth_transaction = MutharayarTransaction.find(params[:id])
  end

  def update
  	@member = MutharayarTransaction.find(params[:id])
  	if @member.update_attributes(params[:mutharayar_transaction])
  	  flash[:notice] = "member was saved"	
  	  redirect_to mutharaiyar_mutharayar_transactions_path
  	else
  	  flash[:notice] = "member was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@member = MutharayarTransaction.find(params[:id])
  	@member.destroy
  	redirect_to mutharaiyar_mutharayar_transactions_path
  end

end
