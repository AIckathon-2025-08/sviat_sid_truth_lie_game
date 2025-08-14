class Statement < ApplicationRecord
  belongs_to :game
  has_many :votes, dependent: :destroy
  
  validates :content, presence: true
  validates :is_truth, inclusion: { in: [true, false] }
  
  scope :truths, -> { where(is_truth: true) }
  scope :lies, -> { where(is_truth: false) }
  
  def vote_count
    votes.count
  end
end
