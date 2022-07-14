class PagesController < ApplicationController
  def contact
  end

  def about
    @title = "My cool page!"
  end

  def home
    @projects = Project.all.limit(100)
  end

  def error
  end

end