class FillFullNamesInStudyRequests < ActiveRecord::Migration
  def change
    StudyRequest.find_each do |study_request|
      study_request.parent_full_name = "#{study_request.parent_last_name} #{study_request.parent_first_name} #{study_request.parent_middle_name}"
      study_request.children_full_name = "#{study_request.children_last_name} #{study_request.children_first_name} #{study_request.children_middle_name}"
      study_request.save
    end
  end
end
