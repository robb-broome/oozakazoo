module FlashHelper
  
  def flashes
    {:partial => '/shared/flash', :object => flash}
  end
  
  def flash_names
    [:notice, :error, :message, :success]
  end
  
end