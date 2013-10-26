class TeachersController < ApplicationController
  def index
    @course_name  = Rails.configuration.course_name
    @course_email = Rails.configuration.course_email
    @teachers     = User.admins.page params[:page]
  end

  def show
    @teacher = User.admins.find params[:id]
  end
end
