class OpeningsController < ApplicationController
  def show
	  @opening = Opening.find(params[:id])
  end
  
  def new
    @opening = Opening.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @opening }
    end
  end

end
