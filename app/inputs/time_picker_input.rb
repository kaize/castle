class TimePickerInput < SimpleForm::Inputs::Base
  def input
    input_html_options[:data] = {behaviour: 'timepicker'}
    @builder.text_field(attribute_name, input_html_options)
  end
end