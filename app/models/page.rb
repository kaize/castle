class Page < ActiveRecord::Base
  attr_accessible :body, :title, :uri

  validates :title, presence: true
  validates :body, presence: true
  validates :uri, presence: true, slug: true, uniqueness: true

  def to_s
    title
  end

  def to_param
    uri
  end
end
