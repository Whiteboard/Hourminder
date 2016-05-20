class AdminController < ApplicationController
  def week
    @guilds = Guild.all
  end
end
