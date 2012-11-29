class WelcomeController < ApplicationController
  def index
    @title = 'Experience'
  end
  
  def education
    @title = 'Education'
  end
  
  def skills
    @title = 'Skills'
  end

end
