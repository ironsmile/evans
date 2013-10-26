require 'spec_helper'

describe TeachersController do
  let(:teachers) { double }

  before do
    User.should_receive(:admins).and_return(teachers)
  end

  describe "GET index" do
    before do
      teachers.should_receive(:page).with('3').and_return('teachers')
    end

    it "paginates all teachers to @teachers" do
      get :index, page: '3'
      assigns(:teachers).should eq 'teachers'
    end

    it "assigns course name to @course_name" do
      Rails.configuration.stub course_name: 'Programming'
      get :index, page: '3'
      assigns(:course_name).should eq 'Programming'
    end

    it "assigns course name to @course_email" do
      Rails.configuration.stub course_email: 'email@example.com'
      get :index, page: '3'
      assigns(:course_email).should eq 'email@example.com'
    end
  end

  describe "GET show" do
    let(:teacher) { double }

    before do
      teachers.stub find: teacher
    end

    it "looks up the teacher by id" do
      teachers.should_receive(:find).with('42').and_return(teacher)
      get :show, id: '42'
    end

    it "assigns the teacher to @teacher" do
      get :show, id: '42'
      assigns(:teacher).should eq teacher
    end
  end
end
