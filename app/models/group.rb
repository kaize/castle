class Group < ActiveRecord::Base
  attr_accessible :name, :union_id

  belongs_to :union, inverse_of: :group
  has_many :schedules

  validates :name, presence: true

  def to_s
    name
  end

end
