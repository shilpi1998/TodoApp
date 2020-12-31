class TodoItem < ApplicationRecord
  belongs_to :todo_list
  validates :content, :due_date, :priority, presence: true

end
