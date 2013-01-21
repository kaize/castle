class GroupTypeDecorator < Draper::Base
  decorates_association :instructors

  def to_s
    name
  end
end