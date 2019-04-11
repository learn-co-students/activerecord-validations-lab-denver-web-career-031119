class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-fiction)}
  validate :not_clickbait

  def not_clickbait
    if title.present?
      unless title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")
        errors.add(:title, "is not clickbait")
      end
    end
  end

end
