class EventsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :show]

    def index
        @events = Event.all.to_a.each_slice(3).to_a
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @new_event = Event.new
    end

    def create
        @new_user = current_user
        @new_event = Event.new(title: params[:title], description: params[:description], location: params[:location], duration: params[:duration].to_i, price: params[:price], start_date: params[:start_date], user: @new_user) 
    
        if @new_event.save
            redirect_to '/events'
          else
            render new_event_path
          end
    end

    def update
    end

    def destroy
    end

end
