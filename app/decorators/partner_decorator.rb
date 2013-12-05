class PartnerDecorator < ApplicationDecorator
  delegate_all

  def logo
    if url.blank?
      h.content_tag(:div, class: "partner-item-logo") do
        h.image_tag(image)
      end
    else
      h.link_to h.image_tag(image), url, class: "partner-item-logo", target: '_blank'
    end
  end

end
