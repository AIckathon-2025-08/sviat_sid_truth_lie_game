class Vote < ApplicationRecord
  belongs_to :game
  belongs_to :statement
  
  validates :employee_name, presence: true
  validates :employee_name, uniqueness: { scope: :game_id, message: "has already voted in this game" }
  
  def self.employee_has_voted?(game_id, employee_name)
    exists?(game_id: game_id, employee_name: employee_name)
  end
end
