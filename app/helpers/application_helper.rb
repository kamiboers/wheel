module ApplicationHelper

def flash_class(level)
    case level
        when "info" then "flash info"
        when "success" then "flash success"
        when "warning" then "flash warning"
    end
end

end