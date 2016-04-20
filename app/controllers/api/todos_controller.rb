class Api::TodosController < ApplicationController

  def create
    render json: Todo.create!(todo_params)
  end

  def update
    todo = Todo.find(params[:id])
    todo.done = todo.done ? false : true
    todo.save!
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy!
    render json: todo
  end

  def show
    todo = Todo.find(params[:id])
    render json: todo
  end

  def index
    render json: Todo.all
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :body)
  end
end
