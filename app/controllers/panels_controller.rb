class PanelsController < ApplicationController
  def fridge
    @users = User.all
  end
end
