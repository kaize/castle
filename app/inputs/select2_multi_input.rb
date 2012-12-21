class Select2MultiInput < SimpleForm::Inputs::CollectionSelectInput
  def input_html_classes
    super << "select2"
  end

  def input_html_options
    super.merge(multiple: true)
  end
end
