class Instructor < ActiveRecord::Base
  attr_accessible :description, :first_name, :last_name, :middle_name, :avatar

  has_many :union_instuctor_relations, dependent: :destroy, class_name: ::UnionInstructorRelation
  has_many :instruct_unions, through: :union_instuctor_relations

  has_many :group_instuctor_relations, dependent: :destroy, class_name: ::GroupInstructorRelations
  has_many :instruct_groups, through: :group_instuctor_relations

  has_many :lead_unions, class_name: Union

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :description, presence: true

  mount_uploader :avatar, InstructorAvatarUploader

  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end

  def to_s
    full_name
  end

end
