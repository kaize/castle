class UnionInstructorRelation < ActiveRecord::Base
  attr_accessible :instructor_id, :leader, :union_id, :instructor

  belongs_to :instructor
  belongs_to :union

end
