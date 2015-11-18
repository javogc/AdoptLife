class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
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
  end

  private
  def animal_params
    params.require(:animal).permit(:name, :photo, :species,
                                   :details,:size,:rescuer_id,:adoptant_id)
  end
end
