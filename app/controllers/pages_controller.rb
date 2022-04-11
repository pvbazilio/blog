class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:landing, :about]
  def index
  end

  def about
  end

end
