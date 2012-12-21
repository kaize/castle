class DatepickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    super.merge(type: :text)
  end
end
