class Mutharaiyar::MutharayarTransactionsController < ApplicationController
 
  def index
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
