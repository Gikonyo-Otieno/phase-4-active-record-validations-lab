class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :clickbaity?
  
    CLICKBAITY_PATTERNS = [
      /Won't Believe/i,
      /Secret/i,
      /Top \d/i,
      /Guess/i
    ]
  
    def clickbaity?
      if CLICKBAITY_PATTERNS.none? { |pat| pat.match title }
        errors.add(:title, "must be clickbaity")
      end
    end
end
