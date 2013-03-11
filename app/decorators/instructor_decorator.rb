class InstructorDecorator < ApplicationDecorator
  decorates :instructor
  def to_s
    [first_name, middle_name, last_name].compact.join(" ")
  end
end
