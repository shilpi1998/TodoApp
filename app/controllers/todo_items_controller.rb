class TodoItemsController < ApplicationController
 before_action :set_todo_list
def create
 @todo_item = @todo_list.todo_items.create(todo_item_params)
 redirect_to @todo_list
end

def destroy
 @todo_item = @todo_list.todo_items.find(params[:id])
 if @todo_item.destroy
  flash[:success] = "Todo List item was deleted."
 else
  flash[:error] = "Todo List item could not be deleted."
 end
 redirect_to @todo_list
end

def update
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.update(todo_item_params)
       flash[:success] = "Todo List item was successfully updated."
       redirect_to @todo_list
    else
       render :edit
    end
  end

private
def set_todo_list
 @todo_list = TodoList.find(params[:todo_list_id])
end
def todo_item_params
 params[:todo_item].permit(:content, :due_date, :priority)
end
end
