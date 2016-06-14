class Mutharaiyar::MuthTransactionsController < ApplicationController
 
  def index
  	@transactions = MuthTransaction.order("name")
  end  

  def new
    @transactions = MuthTransaction.order("name")
    @transaction = MuthTransaction.new
  end

  def create
  	@transaction = MuthTransaction.new(params[:transaction])
  	if @transaction.save
  	  flash[:notice] = "transaction was saved"	
  	  redirect_to mutharaiyar_members_path
  	else
      @locations = MuthTransaction.order("name")
  	  flash[:notice] = "member was not saved"	
  	  render :action => :new
  	end 
  end

  def edit
  	@member = MuthTransaction.find(params[:id])
  end

  def update
  	@member = MuthTransaction.find(params[:id])
  	if @member.update_attributes(params[:member])
  	  flash[:notice] = "member was saved"	
  	  redirect_to mutharaiyar_members_path
  	else
  	  flash[:notice] = "member was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@member = MuthTransaction.find(params[:id])
  	@member.destroy
  	redirect_to mutharaiyar_members_path
  end

end
