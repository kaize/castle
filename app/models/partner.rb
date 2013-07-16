class Partner < ActiveRecord::Base
  include PartnerRepository

  attr_accessible :image, :name, :url, :order_at
  validates :name, presence: true

  mount_uploader :image, PartnerImageUploader

end