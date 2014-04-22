class HomeController < ApplicationController

  def home
    
  end

  def who_are

  end

  def products
    if !params[:mark_id].nil?
      @mark = Mark.find(params[:mark_id])
    end
  end
end
