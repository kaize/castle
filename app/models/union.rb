class Union < ActiveRecord::Base
  include UnionRepository
  
  #define_index do
  #  indexes :name
  #  indexes :description
  #end
  
  
  attr_accessible :category_id, :description, :name, :leader_id
  
  belongs_to :category, inverse_of: :unions

  has_many :photos, inverse_of: :unions
  has_many :groups, inverse_of: :union

  has_many :union_instuctor_relations, dependent: :destroy, class_name: ::UnionInstructorRelation
  has_many :instructors, through: :union_instuctor_relations

  has_many :study_requests

  belongs_to :leader, class_name: Instructor
  
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true

  def to_s
    name
  end

end
