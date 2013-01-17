class StudyRequest < ActiveRecord::Base
  attr_accessible :address, :birth_date, :children_first_name, :children_last_name, :children_middle_name,
                  :note, :parent_first_name, :parent_last_name, :parent_middle_name, :phone, :school, :union_id

  belongs_to :union

  validates :address, presence: true
  validates :birth_date, presence: true
  validates :children_first_name, presence: true
  validates :children_last_name, presence: true
  validates :parent_first_name, presence: true
  validates :parent_last_name, presence: true
  validates :phone, presence: true
  validates :union_id, presence: true

end
