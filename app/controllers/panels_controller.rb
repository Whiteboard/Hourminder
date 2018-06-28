class PanelsController < ApplicationController
  include TeamgridTools
  def fridge
    @users = User.all
    @projects = projects
    if params[:projectId]
      @times = times(projectId: params[:projectId])
      sorted_times = @times.map {|t| {user_name: t["userName"], created_at: t["createdAt"], duration: t["duration"] }}
      grouped_by_user = sorted_times.group_by {|st| st[:user_name]}
      @user_involvement = grouped_by_user.map {|k,v| {k => v.map{|t| t[:duration] }.sum }}
      puts @user_involvement
    end
  end
end
