class Instructor < ActiveRecord::Base
  attr_accessible :description, :first_name, :last_name, :middle_name, :avatar

  has_many :union_instuctor_relations, dependent: :destroy, class_name: ::UnionInstructorRelation
  has_many :instruct_unions, through: :union_instuctor_relations

  has_many :lead_unions, class_name: Union

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :description, presence: true

  mount_uploader :avatar, InstructorAvatarUploader

end
