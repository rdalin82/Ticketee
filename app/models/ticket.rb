class Ticket < ActiveRecord::Base
  belongs_to :project
  validates :name, :description, presence: true 
  validates :description, length: { maximum: 1000 }
  validates :description, presence: true, length: { minimum: 10 } 
end
