# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = Category.create(name: "test", description: "test")
Partner.create(image: "123.jpg", name: "test", url: "123", order_at: "123")
block = Block.create(title: "test", body: "test", order_at: "123", on_main: true)
block.publish!
Union.create(name: "test", description: "test", category_id: category.id)
menuitem = MenuItem.create(title: "string")
page = Page.new(title: "test", body: "test", order_at: "123")
page.menu_item_id = menuitem.id
page.save!
page.publish!