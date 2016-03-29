class ContactsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: user.shared_contacts + user.contacts
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    # contact = Contact.find(:id)
    begin
      contact = Contact.find(params[:id])
      render json: contact
    rescue ActiveRecord::RecordNotFound => e
      render text: "#{e.message}", status: 404
    end

  end

  def update
    contact = Contact.find(params[:id])
    begin
      contact.update(contact_params)
      render json: contact
    rescue ActionController::ParameterMissing => e
      render text: "#{e.message}", status: 422
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    render json: contact
  end

  private
  def contact_params
    params.require(:contact).permit(:email, :user_id, :name)
  end

end
