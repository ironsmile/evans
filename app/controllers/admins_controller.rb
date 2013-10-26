class TeamsController < ApplicationController
  def show
    raise
    @admins = User.admins
  end
end
