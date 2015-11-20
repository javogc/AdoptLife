class EventsController < ApplicationController

  before_action :logged_in_user, ony: [:new,:edit,:create,:update]

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    if event.save
      event.organizers << current_user
      flash[:success]="Event created"
      redirect_to event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    event = Event.find(params[:id])
    if params[:commit] == "Add Animals"
      params[:events][:animals].each do |selected_animal|
        if selected_animal != ""
          event.animals << Animal.find(selected_animal)
        end
      end
      redirect_to event
    elsif params[:commit] == "Remove Animal"
      event.animals.delete(Animal.find(params[:animal_to_remove]))
      redirect_to event
    else
      if event.update_attributes(event_params)
        flash[:success]="Event updated"
        redirect_to event
      else
        render 'edit'
      end
    end
  end

  def show
    @event = Event.find(params[:id])
    @isOrganizer = user_organizer?
    @assistingAnimals = @event.animals.where(rescuer: current_user)
    @user_rescued_unadopted = current_user.rescued_animals.where(adoptant_id: nil)
  end

  private

  def event_params
    params.require(:event).permit(:date,:name,:addrline1,:addrline2)
  end

  def user_organizer?
    @event.organizers.include? current_user
  end

end
