class Union::Photo < ActiveRecord::Base
  attr_accessible :asset, :name, :union_id

  belongs_to :union, inverse_of: :photos

  mount_uploader :asset, UnionPhotoUploader
end
