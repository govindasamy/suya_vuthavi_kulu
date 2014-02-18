class SitesController < ApplicationController
  skip_before_filter :authenticate_user!

  def home
    
  end

  def contact_us
  end	

  def about_us
  end
  def events
  end
end	