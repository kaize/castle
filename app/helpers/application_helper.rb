module ApplicationHelper
  def item(tag, name, path, link_options = {})
    options = {}
    options[:class] = :active if current_page?(path)
    link = link_to(name, path, link_options)
    content_tag(:li, link, options)
  end

  def item_page(tag, page, link_options = {})
    path = page_path(page)
    item(tag, page, path, link_options)
  end

  def model_item(tag, model, path, options = {})
    item(tag, model.model_name.human, path, options)
  end

  def union_item(tag, name, path, options ={})
    new_name = "#{content_tag(:i, '', class: 'icon-chevron-right')} #{name}".html_safe
    item(tag, new_name, path, options)
  end

  def truncate_sanitize_rem_br(text, length)
    return '' if text.blank?
    truncate( sanitize(text, :tags => []), :length => length ).gsub(/\r/, "").gsub(/\n/, "").gsub(/&[a-z]{0-5}\.\.\.$/, "...")
  end
  
  def nav_activities
    Activity.scoped
  end
  
  def nav_categories
    Category.scoped
  end

  def partners
    Partner.asc_by_order_at
  end

  def contacts_page
    Page.find_by_uri!('contacts')
  end

  def support_page
    Page.find_by_uri!('support')
  end

  def unions
    Union.all
  end

  def show_tree(arrange_hash, &block)
    return if arrange_hash.empty?
    content_tag :ul do
      items = arrange_hash.map do |item, children|
        content_tag :li do
          html = capture item, &block
          subtree = show_tree(children, &block)
          [html, subtree].compact.map!(&:to_s).join.html_safe
        end
      end
      items.join.html_safe
    end
  end
end
