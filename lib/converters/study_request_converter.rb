#me to refactor this
require 'csv'
module Converters
  class StudyRequestConverter

    def self.to_csv(study_requests)
      attrs = [:id, :parent_last_name, :birth_date, :phone, :email, :created_at].map{|x| x.to_s}
      CSV.generate do |csv|
        csv << attrs.map{|x| StudyRequest.human_attribute_name(x)} + [StudyRequest.human_attribute_name(:union_id)]
        study_requests.each do |study_request|
          csv << study_request.attributes.values_at(*attrs) + [study_request.union.name]
        end
      end
    end

  end
end