class ExpencesController < ApplicationController
 
  require 'time'
  skip_before_filter :authenticate_user!, :only => [:index]

  def index
    @expences = [] #Donation.where("donor_id is null").order("date_collected")
  end  

  def new
    @donation = Donation.new
  end

  def create
    # status = Transaction::GuardedBlock.execute do |g|
      for row in (1..params[:max_row].to_i)
        key_value = ["name", "date_collected", "amount", "description"].inject({}){|acc,val| acc.merge!({val => params["donation"][val][row.to_s]}) }
        key_value[:event_id] = params[:event][:id]
        expence = Donation.new(key_value)
        expence.save
      #   g.b { expence.save }
      # end  
    end
    if status
      flash[:notice] = "Expences was saved" 
      redirect_to expences_path
    else
      flash[:notice] = "Expences was not saved" 
      render :action => :new
    end 
  end

  def edit
  	@donation = Donation.find(params[:id])
  end

  def update
  	@donation = Donation.find(params[:id])
  	if @donation.update_attributes(params[:donation])
  	  flash[:notice] = "Expences was saved"	
  	  redirect_to expences_path
  	else
  	  flash[:notice] = "Expences was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@expence = Donation.find(params[:id])
  	@expence.destroy
  	redirect_to expence_path
  end

  # def search
  #   from_date = Time.parse(params[:expence][:date_collected1])
  #   to_date = Time.parse(params[:expence][:date_collected2])
  #   from_date.strftime("%y-%m-%d")
  #   to_date.strftime("%y-%m-%d")
  #   con = []
  #   con << "name like '%#{params[:expence][:name]}%'" unless params[:expence][:name].blank?
  #   con << "amount = '#{params[:expence][:amount]}'" unless params[:expence][:amount].blank?
  #   con << "date(date_collected) between '#{from_date}' and '#{to_date}'" unless from_date.blank?
  #   @expences = Expence.where(con.join(" and ")).order("name")
  #   render :action => :index
  # end

  def search
    @expences = Donation.where(:event_id => params[:event][:id]).where("donor_id is null").order("date_collected")
    render :action => :index
  end

end