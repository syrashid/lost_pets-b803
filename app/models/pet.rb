class Pet < ApplicationRecord
  # We push the species into a constant so that it is accessible through the class and can be utilized in a select dropdown, see _form.html.erb
  SPECIES = %w(dog cat rabbit snake turtle horse donkey)
  validates :name, presence: true
  validates :found_on, presence: true
  validates :species, inclusion: { in: SPECIES }

  def found_days_ago
    "#{(Date.today - found_on).to_i}"
  end
end
