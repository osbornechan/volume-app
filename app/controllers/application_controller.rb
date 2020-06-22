class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if volunteer_signed_in? || organiser_signed_in?
          activities_path
        else
          root_path
        end
    end
    
    def after_sign_out_path_for(resource)
        root_path
    end
end
