class GroupInstructorRelations < ActiveRecord::Base
  attr_accessible :instructor_id, :group_id, :instructor

  belongs_to :instructor
  belongs_to :group

end
