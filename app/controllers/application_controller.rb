# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  session :off
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  
  
  def rescue_404
     rescue_action_in_public CustomNotFoundError.new
   end

   def rescue_action_in_public(exception)
     case exception
       when CustomNotFoundError, ::ActionController::UnknownAction then
         #render_with_layout "shared/error404", 404, "standard"
         render :template => "shared/error404", :layout => "standard", :status => "404"
       else
         @message = exception
         render :template => "shared/error", :layout => "standard", :status => "500"
     end
   end

   def local_request?
     return false
   end
  
end
