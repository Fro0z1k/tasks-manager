class DashboardController < ApplicationController

  def index
    @projects = current_user.projects.order(:created_at)
  end

end