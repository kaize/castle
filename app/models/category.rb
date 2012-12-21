class Category < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :unions, inverse_of: :category

  validates :name, presence: true
  validates :description, presence: true

  def to_s
    name
  end
end
