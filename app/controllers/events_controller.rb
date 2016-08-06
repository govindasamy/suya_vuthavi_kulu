class EventsController < ApplicationController
  layout "site_layout"
 
  skip_before_filter :authenticate_user!, :only => [:index, :new, :create, :edit, :update, :destroy]

  before_filter :only => [:new, :create, :edit, :update, :destroy], :if => Proc.new{ !current_user || !current_user.role_names.include?("Admin") } do
    flash[:error] = "Need admin permission"
    redirect_to events_path
  end 

  def index
  	@events = Event.order("name")
  end  

  def new
    @event = Event.new
  end

  def create
  	@event = Event.new(params[:event])
  	if @event.save
  	  flash[:notice] = "Event was saved"	
  	  redirect_to events_path
  	else
  	  flash[:notice] = "Event was not saved"	
  	  render :action => :new
  	end 
  end

  def edit
  	@event = Event.find(params[:id])
  end

  def update
  	@event = Event.find(params[:id])
  	if @event.update_attributes(params[:event])
  	  flash[:notice] = "Event was saved"	
  	  redirect_to events_path
  	else
  	  flash[:notice] = "Event was not saved"	
  	  render :action => :new
  	end
  end

  def destroy
  	@event = Event.find(params[:id])
  	@event.destroy
  	redirect_to events_path
  end

end
