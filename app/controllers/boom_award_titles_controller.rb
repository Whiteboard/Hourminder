class BoomAwardTitlesController < ApplicationController
  def new

    @boom_award_title = BoomAwardTitle.new

  end
  def create
    @boom_award_title = BoomAwardTitle.new(boom_award_title_params)
    if @boom_award_title.save
      redirect_to root_path, notice: "Boom Award has been passed!"
    else
      render :new, notice: "Something went wrong..."
    end
  end
private
  def boom_award_title_params
    params.require(:boom_award_title).permit(:user_id)
  end
end
