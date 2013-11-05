class TodoController < ApplicationController
  # List all persons (show table of persons in HTML)
  def index
    @todo = Todo.all.entries
  end
  
  # Show detail for a person with ID = params[:id] (in HTML)
  def show
    @todo = Todo.find_by(id: params[:id])
  end
  
  # Form for adding a new person (in HTML)
  def new
    @todo = Todo.new
  end
  
  # POST to this to create a new person, then redirect to show
  def create
    @todo = Todo.create(todo_params)
    
    redirect_to show_todo_url(@todo)
  end
  
  # Form for updating a person with ID = params[:id] (in HTML)
  def edit
    @todo = Todo.find_by(id: params[:id])
  end
  
  # PUT or PATCH to this to update person with ID = params[:id]
  # then redirect to show
  def update
    @todo = Todo.find_by(id: params[:id])
    
    @todo.update_attributes(todo_params)
    
    redirect_to show_todo_url(@todo)
  end
  
  # Destroy the person with ID = params[:id]
  # then redirect to index to list remaining persons
  def destroy
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    
    redirect_to todos_url
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(
      :task, :task_duedate, :task_owner)
  end
end

