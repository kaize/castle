class DescriptionInput < SimpleForm::Inputs::TextInput

  def input_html_options
    super.merge(rows: 2)
  end
end