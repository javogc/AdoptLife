class RequestsController < ApplicationController
  before_action :logged_in_user

  def index
    @user = current_user
    @received_requests = Request.where(recipient_id: current_user.id)
    @sent_requests = Request.where(sender_id: current_user.id)
  end

  def show
  end

  def create
    animal = Animal.find(params[:animal_id])

    request = animal.requests.new()
    request.status = "sent"
    request.sender_id = current_user.id
    request.recipient_id = animal.rescuer_id
    if request.save
      flash[:success] = "Request sent successfully"
    end
    redirect_to "/animals/#{animal.id}"
  end

  def new
    animal = Animal.find(params[:animal_id])
    @request = animal.requests.build
  end

  def delete
  end

  def update
    request = Request.find(params[:id])
    request.status = params[:status]
    if request.save
      flash[:success] = "Request sent successfully"
    end
    if(params[:status]=='accepted')
      animal = Animal.find(request.animal_id)
      animal.adoptant_id = params[:adoptant]
      if animal.save
        flash[:success]=="Adoptant added successfully"
      end
    end
    redirect_to "/requests"
  end

  def edit
  end

  private
  def request_params
    params.require(:animal_id)
  end
end
