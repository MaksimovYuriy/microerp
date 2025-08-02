class ApplicationController < ActionController::Base
    include Graphiti::Rails::Responders

    private

    def authenticate!
        return @current_user if defined?(@current_user)
        @current_user = CurrentUserService.new(request).call
        unless @current_user
            render json: { errors: [{ title: 'Unauthorized', detail: 'Invalid or missing token' }] }, status: :unauthorized
            return
        end
    end

    def current_user
        @current_user
    end
end
