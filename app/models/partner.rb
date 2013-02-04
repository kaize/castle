class Partner < ActiveRecord::Base

  attr_accessible :image, :name, :url
  validates :name, presence: true

  mount_uploader :image, PartnerImageUploader

end