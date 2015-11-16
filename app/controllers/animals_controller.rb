class AnimalsController < ApplicationController
  before_action :logged_in_user , only: [:create,:new, :edit, :update]
  before_action :present_owner , only:[:edit,:update]

  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
    @alreadyBookmarked = @animal.bookmarkers.include? current_user
    @attendingEvents = @animal.events
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.rescuer_id = current_user.id
    if @animal.save
      flash[:success] = "Animal created sucessfully"
      redirect_to @animal
    else
      render 'new'
    end
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update_attributes(animal_params)
      flash[:success] = "Animal updated"
      redirect_to @animal
    else
      render 'edit'
    end
  end

  def delete
    present_owner
    Animal.find(params[:id]).destroy
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :photo, :species,
                                   :details,:size,:rescuer_id,:adoptant_id)
  end

  def present_owner
    @animal = Animal.find(params[:id])
    redirect_to :action => 'show' unless current_user.id == @animal.rescuer_id
  end
end
