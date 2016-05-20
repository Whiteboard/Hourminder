class AdminController < ApplicationController
  def week
    @guilds = Guild.all
    @user = User.all
  end
end
