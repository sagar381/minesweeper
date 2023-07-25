module BoardsHelper
    def show_button(value)
        bg = 'background'+ value.to_s
        content_tag(:button, "", class: "button #{bg} border")
    end
end
  
  
  
  
  
  