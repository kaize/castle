class Group < ActiveRecord::Base
  attr_accessible :name, :union_id, :instructor_ids

  belongs_to :union, inverse_of: :groups
  has_many :schedules, dependent: :destroy

  has_many :group_instuctor_relations, dependent: :destroy, class_name: ::GroupInstructorRelations
  has_many :instructors, through: :group_instuctor_relations

  validates :name, presence: true

  def to_s
    name
  end

end
