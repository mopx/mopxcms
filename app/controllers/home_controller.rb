class HomeController < ApplicationController
  def index
  end

  def robots
  	render :inline => Setting.get("robots_txt", nil, true), :content_type => "text/plain"
  end

end
