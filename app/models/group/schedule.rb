class Group::Schedule < ActiveRecord::Base
  attr_accessible :finish_at, :group_id, :start_at, :date, :classroom_id

  belongs_to :group, inverse_of: :schedules
  belongs_to :classroom
  
  validates :date, presence: true
  validates :finish_at, presence: true
  validates :start_at, presence: true
end
