module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages opts = {}
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end

  def heart_icon product_slug, is_favorite
    content_tag :span, :class => "icon-svg inline #{ is_favorite ? 'favorited' : '' }", :id => product_slug do
			content_tag :svg, :class=> "svg-icon", :id => 'icon', :viewBox => "0 0 24 24" do
				content_tag :path, :fill => "none", :d => "M12 4.248c-3.148-5.402-12-3.825-12 2.944 0 4.661 5.571 9.427 12 15.808 6.43-6.381 12-11.147 12-15.808 0-6.792-8.875-8.306-12-2.944z" do
                end
          end
			end
  end
  
end
