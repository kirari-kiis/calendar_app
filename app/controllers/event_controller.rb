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
    @group_event = GroupEvent.all
    @date = Event.order("start_date ASC")
    @events = @date.all
    @users = User.all
  end

  def group_post
  end

  def group_post_create
    @group = GroupEvent.new(group_event: params[:group_event],
                                   date: params[:date],
                                   description: params[:description],
                                   time: params[:time])
    @group.save
    redirect_to("/event/group")
  end

  def show
    @event = Event.where(start_date: params[:start_date])
    @user = User.where(id: params[:user_id])

    @title = @event.first
  end

  def group_show
    @group_event = GroupEvent.find(params[:id])
    @events = Event.where(start_date: @group_event.date)
    @users = User.all
  end

  def edit
    @event = Event.find_by(id: params[:id])
  end

  def group_edit
    @group_event = GroupEvent.find_by(id: params[:id])
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

  def group_update
    @group_event = GroupEvent.find_by(id: params[:id])
    event = Event.where(user_id: current_user.id)

    event.each do |event|
      if event.event == @group_event.group_event then
        if event.start_date == @group_event.date then
          if event.time == @group_event.time then
            if event.description == @group_event.description then
              if event.join != nil then
                event.event = params[:group_event]
                event.start_date = params[:date]
                event.time = params[:time]
                event.description = params[:description]
                event.save
              end
            end
          end
        end
      end
    end

    @group_event.group_event = params[:group_event]
    @group_event.date = params[:date]
    @group_event.time = params[:time]
    @group_event.description = params[:description]

    @group_event.save

    redirect_to("/event/#{@group_event.id}/group_show")

  end

  def destroy
    @event = Event.find_by(id: params[:id])
    @event.destroy

    flash[:danger] = "予定を削除しました"
    redirect_to("/home/top")

  end

  def group_event_destroy
    @group_event = GroupEvent.find_by(id: params[:id])
    event = Event.where(user_id: current_user.id)

    event.each do |event|
      if event.event == @group_event.group_event then
        if event.start_date == @group_event.date then
          if event.time == @group_event.time then
            if event.description == @group_event.description then
              if event.join != nil then
                event.destroy
              end
            end
          end
        end
      end
    end
    @group_event.destroy

    flash[:danger] = "予定を削除しました"
    redirect_to("/event/group")
  end

  def join
    group_event = GroupEvent.find(params[:id])
    event = Event.where(user_id: current_user.id)
    i = 0

    event.each do |event|
      if event.event == group_event.group_event then
        if event.start_date == group_event.date then
          if event.time == group_event.time then
            if event.user_id == current_user.id then
              if event.join != nil then
                i = i + 1
              end
            end
          end
        end
      end
    end

    if i == 0 then
      event_new = Event.new(event: group_event.group_event,
                             start_date: group_event.date,
                             time: group_event.time,
                             description: group_event.description,
                             user_id: current_user.id,
                             join: 1)
      event_new.save

      flash[:notice] = "イベントに参加しました"
      redirect_to("/event/group")
    else
      flash[:danger] = "参加済です"
      redirect_to("/event/#{group_event.id}/group_show")
    end

  end
end
