class GameSession
  include ActiveModel::Model
  include ActiveModel::Attributes
  
  attribute :id, :string
  attribute :candidate_name, :string
  attribute :candidate_photo, :string
  attribute :statements, array: true, default: []
  attribute :votes, array: true, default: []
  attribute :created_at, :datetime
  attribute :token, :string
  
  attr_accessor :statements_attributes
  
  validates :candidate_name, presence: true
  validates :candidate_photo, presence: true
  validate :must_have_three_statements
  
  def initialize(attributes = {})
    super
    self.id ||= SecureRandom.uuid
    self.token ||= SecureRandom.alphanumeric(8).upcase
    self.created_at ||= Time.current
    @statements ||= []
    @votes ||= []
    
    # Handle nested attributes
    if attributes[:statements_attributes]
      attributes[:statements_attributes].each do |_, statement_attrs|
        next if statement_attrs[:content].blank?
        add_statement(statement_attrs[:content], statement_attrs[:is_truth] == 'true')
      end
    end
    
    # Ensure created_at is always set
    self.created_at = Time.current if self.created_at.nil?
    
    # Ensure token is always set (ActiveModel::Attributes might override it)
    self.token = SecureRandom.alphanumeric(8).upcase if self.token.nil? || self.token.empty?
  end
  
  def add_statement(content, is_truth)
    statements << {
      id: SecureRandom.uuid,
      content: content,
      is_truth: is_truth,
      order: statements.length
    }
  end
  
  def add_vote(employee_name, statement_id)
    return false if employee_has_voted?(employee_name)
    
    votes << {
      id: SecureRandom.uuid,
      employee_name: employee_name,
      statement_id: statement_id,
      voted_at: Time.current
    }
    true
  end
  
  def employee_has_voted?(employee_name)
    votes.any? { |vote| vote[:employee_name] == employee_name }
  end
  
  def total_votes
    votes.length
  end
  
  def statement_votes(statement_id)
    votes.count { |vote| vote[:statement_id] == statement_id }
  end
  
  def percentage_votes(statement_id)
    return 0 if total_votes == 0
    (statement_votes(statement_id).to_f / total_votes * 100).round(1)
  end
  
  def find_statement(statement_id)
    statements.find { |s| s[:id] == statement_id }
  end
  
  def to_param
    token
  end
  
  def self.generate_token
    SecureRandom.alphanumeric(8).upcase
  end
  
  private
  
  def must_have_three_statements
    if statements.length != 3
      errors.add(:statements, "must have exactly 3 statements")
    end
  end
end
