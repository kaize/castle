class Partner < ActiveRecord::Base

  attr_accessible :image, :name
  validates :name, presence: true

  mount_uploader :image, PartnerImageUploader

end