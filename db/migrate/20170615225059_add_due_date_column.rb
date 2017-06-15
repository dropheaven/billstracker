class AddDueDateColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :bills, :due_date, :string
  end
end
