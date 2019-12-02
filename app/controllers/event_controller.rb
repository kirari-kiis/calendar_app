class EventController < ApplicationController
  def post
  end

  def create
    @event = Event.new(event: params[:event],
                       start_date: params[:start_date],
                       description: params[:description],
                       time: params[:time],
                       user_id: current_user.id)
    @event.save
    flash[:success] = "予定を追加しました"
    redirect_to("/home/top")

  end

  def group
    @date = Event.order("start_date ASC")
    @events = @date.all
    @users = User.all
  end

  def show
    @event = Event.where(start_date: params[:start_date])
    @user = User.where(id: params[:user_id])

    @title = @event.first
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def update
    @event = Event.find_by(id: params[:id])

    @event.start_date = params[:start_date]
    @event.event = params[:event]
    @event.description = params[:description]
    @event.time = params[:time]

    @event.save

    redirect_to("/home/top")
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy

    flash[:danger] = "予定を削除しました"
    redirect_to("/home/top")
  end
end
