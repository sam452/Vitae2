class OpeningsController < ApplicationController
  def show
    begin
	    @opening = Opening.find(params[:id])
	    @title = @opening.name
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
  
  def admin
    @opening = Opening.find(:all)
  end

  def edit
    @opening = Opening.find(params[:id])
  end
  
  def edit
    @opening = Opening.find(params[:id])
  end
  
    def create
    @opening = Opening.new(params[:opening])

    respond_to do |format|
      if @opening.save
        #redirect_to("/#{@opening.pid}", :notice => 'Opening was created.')
        format.html { redirect_to(@opening, :notice => 'Opening was successfully created.') }
        #format.html { redirect_to opening_path(@opening.id), :notice => 'Opening was successfully created.' }
        format.xml  { render :xml => @opening, :status => :created, :location => @opening }
        format.json  { render json: @opening, status: :created, location: @opening }
     else
        format.html { render :action => "new" }
        format.xml  { render :xml => @opening.errors, :status => :unprocessable_entity }
        format.json { render json: @opening.errors, status: :unprocessable_entity }
      end
    end
  end
  
    def update
    @opening = Opening.find(params[:id])
    if @opening.update_attributes(params[:opening])
      flash[:success] = "Profile updated."
      redirect_to @opening
    else
      @title = "Edit opening"
      render 'edit'
    end
  end

    def update
    @opening = Opening.find(params[:id])
    if @opening.update_attributes(params[:opening])
      flash[:success] = "Profile updated."
      redirect_to @opening
    else
      @title = "Edit opening"
      render 'edit'
    end
  end


end
