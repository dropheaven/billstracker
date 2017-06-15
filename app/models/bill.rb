class Bill < ActiveRecord::Base
  belongs_to :user
  validates :name, :amount, presence: true
end
