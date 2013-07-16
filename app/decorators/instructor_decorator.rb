class InstructorDecorator < ApplicationDecorator
  decorates :instructor
  def to_s
    [last_name, first_name, middle_name].compact.join(" ")
  end
end
