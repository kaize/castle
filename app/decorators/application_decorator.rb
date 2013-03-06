class ApplicationDecorator < Draper::Decorator
  delegate_all

  def to_s
    source.to_s
  end

  def self.collection_decorator_class
    ::CastleCollectionDecorator
  end

end