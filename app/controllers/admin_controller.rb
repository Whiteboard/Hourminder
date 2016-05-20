class AdminController < ApplicationController
  def week
    @guilds = Guild.all
    @users = User.all
  end
end
