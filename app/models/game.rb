class Game < ApplicationRecord
  has_many :statements, dependent: :destroy
  has_many :votes, dependent: :destroy
  
  accepts_nested_attributes_for :statements
  
  validates :candidate_name, presence: true
  validates :candidate_photo, presence: true
  
  def active?
    created_at > 2.hours.ago
  end
  
  def total_votes
    votes.count
  end
  
  def statement_votes(statement_id)
    votes.where(statement_id: statement_id).count
  end
  
  def percentage_votes(statement_id)
    return 0 if total_votes == 0
    (statement_votes(statement_id).to_f / total_votes * 100).round(1)
  end
end
