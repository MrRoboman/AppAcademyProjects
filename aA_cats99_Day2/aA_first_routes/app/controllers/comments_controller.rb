class CommentsController < ApplicationController
  def index
    contact = Contact.find(params[:contact_id])
    render json: contact.comments
  end

  def create
    # user = User.find(params[:user_id])
    pars = comment_params
    pars[:user_id] = params[:user_id]
    comment = Comment.new(pars)
    if comment.save
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    # comment = Comment.find(:id)
    begin
      comment = Comment.find(params[:id])
      render json: comment
    rescue ActiveRecord::RecordNotFound => e
      render text: "#{e.message}", status: 404
    end

  end

  def update
    comment = Comment.find(params[:id])
    begin
      comment.update(comment_params)
      render json: comment
    rescue ActionController::ParameterMissing => e
      render text: "#{e.message}", status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :body, :commentable_id, :commentable_type)
  end
end
