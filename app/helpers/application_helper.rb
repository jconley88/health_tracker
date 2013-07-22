module ApplicationHelper

  def alert_class(flash_type)
    flash_type = flash_type.to_s
    case flash_type
      when 'notice'; 'success'
      else flash_type
    end
  end
end
