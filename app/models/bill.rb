class Bill < ActiveRecord::Base
  belongs_to :user
  validates :name, :amount, :due_date, presence: true
end
