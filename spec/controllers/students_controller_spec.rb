require 'spec_helper'

describe StudentsController do
  let(:students) { double }

  before do
    User.should_receive(:students).and_return(students)
  end

  describe "GET index" do
    it "paginates all students to @students" do
      students.should_receive(:page).with('3').and_return('students')
      get :index, page: '3'
      assigns(:students).should eq 'students'
    end
  end

  describe "GET show" do
    let(:student) { double }

    before do
      students.stub find: student
    end

    it "looks up the student by id" do
      students.should_receive(:find).with('42').and_return(student)
      get :show, id: '42'
    end

    it "assigns the student to @student" do
      get :show, id: '42'
      assigns(:student).should eq student
    end
  end
end
