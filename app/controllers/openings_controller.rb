class OpeningsController < ApplicationController
  def show
    begin
	    @opening = Opening.find(params[:id])
	  rescue 
	    ActiveRecord::RecordNotFound
	    render "welcome/index"
	  end
  end
  
  def new
    @opening = Opening.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @opening }
    end
  end

end
