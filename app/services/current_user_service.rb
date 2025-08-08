class CurrentUserService

    def initialize(request)
        @request = request
    end

    def call
        header = @request.headers['Authorization']
        token = header&.split(' ')&.last
        decoded = JwtDecoderService.decode(token)

        current_user = Worker.find_by(id: decoded[:worker_id]) if decoded
    end

end