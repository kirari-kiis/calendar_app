class HomeController < ApplicationController
  def top
    @date = Event.order("start_date ASC")
    @events = @date.where(user_id: current_user.id)
  end
end
