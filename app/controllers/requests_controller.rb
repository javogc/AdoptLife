class RequestsController < ApplicationController
  before_action :logged_in_user

  def index
    @user = current_user
    @received_requests = Request.find_by recipient_id: current_user.id
    @sent_requests = Request.find_by sender_id: current_user.id
  end

  def show
  end

  def create
    animal = Animal.find(params[:animal_id])
    if(params[:commit]=="Request Adoption")
      request = animal.requests.new()
      request.status = "sent for adoption"
    elsif (params[:commit]=="Request Meetup")
      request = animal.requests.new(request_params)
      request.status = "sent for meetup"
    end
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

  def destroy
    request = Request.find(params[:request])
    if(current_user == request.sender)
      request.destroy
    else
      flash[:alert] = "Cannot delete this instance"
    end
    redirect_to current_user
  end

  def update
    request = Request.find(params[:id])
    case params[:commit]
    when "Accept Adoption"
      request.status = "accepted adoption"
      animal = Animal.find(request.animal_id)
      animal.adoptant_id = params[:adoptant]
      if animal.save
        flash[:success]=="Adoptant added successfully"
      end
    when "Deny Adoption"
      request.status = "denied adoption"
    when "Propose Changes"
      request.status = "propose change"
      request.update_attributes(request_params)
    when "Accept Meetup"
      request.status = "accepted meetup"
    when "Deny Meetup"
      request.status = "denied meetup"
    when "Propose More Changes"
      request.status = "sent for meetup"
      request.update_attributes(request_params)
    end
    if request.save
      flash[:success] = "Request sent successfully"
    end
    redirect_to current_user
  end

  def edit
  end

  private
  def request_params
    params.require(:request).permit(:date,:time,:location)
  end
end
