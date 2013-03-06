class InstructorDecorator < ApplicationDecorator
  decorates :instructor
  delegate_all
  def to_s
    [last_name, first_name, middle_name].compact.join(" ")
  end
end
