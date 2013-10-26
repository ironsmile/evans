class StudentsController < ApplicationController
  def index
    @students = User.students.page params[:page]
  end

  def show
    @student = User.students.find params[:id]
  end
end
