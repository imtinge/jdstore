module SemanticFlashesHelper
  ALERT_TYPES = [:error, :info, :success, :warning]

  def semantic_flashes
    output = ''
    flash.each do |type, message|
      next if message.blank?
      type = :success if type.to_sym == :notice
      type = :error   if type.to_sym == :alert
      next unless ALERT_TYPES.include?(type.to_sym)
      output += flashes_container(type, message)
    end

    raw(output)
  end

  def flashes_container(type, message)
    content_tag(:div, class: "ui #{type} message") do
      concat content_tag(:i, '', class: "close icon") 
      concat message
      concat javascript_tag <<-EOF
        $('.message .close')
          .on('click', function() {
            $(this)
              .closest('.message')
              .transition('fade')
            ;
          })
        ;
      EOF
    end
  end
end