class ApplicationController < ActionController::Base
    include Graphiti::Rails::Responders

    private

    def current_user
        return @current_user if defined?(@current_user)
        @current_user = CurrentUserService.new(request).call
    end
end
