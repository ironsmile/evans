require 'spec_helper'

describe TeamsController do
  describe "GET show" do
    let(:admins) { double }

    it "paginates all admin users" do
      User.should_receive(:admins).and_return(admins)
      admins.should_receive(:page).with('3').and_return('admins')
      get :show, page: '3'
      assigns(:admins).should eq 'admins'
    end
  end
end
