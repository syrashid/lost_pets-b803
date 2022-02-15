class Pet < ApplicationRecord
  validates :name, presence: true
  validates :found_on, presence: true
  validates :species, inclusion: { in: %w(dog cat rabbit snake turtle horse donkey)}

  def found_days_ago
    "#{(Date.today - found_on).to_i} day(s) ago"
  end
end
