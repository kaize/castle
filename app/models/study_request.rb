class StudyRequest < ActiveRecord::Base
  attr_accessible :address, :birth_date, :note, :phone, :school, :union_id, :email, :parent_full_name, :children_full_name

  belongs_to :union

  validates :address, presence: true
  validates :birth_date, presence: true
  validates :parent_full_name, presence: true
  validates :children_full_name, presence: true
  validates :phone, presence: true
  validates :union, presence: true
end
