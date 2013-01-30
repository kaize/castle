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
    Activity.all
  end
  
  def nav_categories
    Category.all
  end

  def contacts_page
    Page.find_by_uri!('contacts')
  end

  def support_page
    Page.find_by_uri!('support')
  end
end
