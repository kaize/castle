require 'test_helper'

class MenuItemTest < ActiveSupport::TestCase

  test 'root with sub_item with page' do
    root = create :menu_item
    sub_item = create :menu_item, parent: root
    create :page, menu_item: sub_item

    arrange = MenuItem.published_arrange 2

    assert_includes arrange, root
    assert_includes arrange[root], sub_item
  end

  test 'root with sub_item without page' do
    root = create :menu_item
    create :menu_item, parent: root

    arrange = MenuItem.published_arrange 2

    refute_includes arrange, root
  end

  test 'root without page' do
    root = create :menu_item

    arrange = MenuItem.published_arrange 2

    refute_includes arrange, root
  end

  test 'root with page' do
    root = create :menu_item
    create :page, menu_item: root

    arrange = MenuItem.published_arrange 2

    assert_includes arrange, root

  end

end
