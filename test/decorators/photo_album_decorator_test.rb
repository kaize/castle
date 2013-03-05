require 'test_helper'

class PhotoAlbumDecoratorTest < Draper::TestCase
  assigns(:article).should be_decorated_with ArticleDecorator
end
