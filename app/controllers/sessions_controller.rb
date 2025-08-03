class SessionsController < ApplicationController
    before_action :authenticate!, only: [:destroy]

    def create
        worker = Worker.find_by(username: login_params[:username])

        if worker&.authenticate(login_params[:password])
            token = JwtDecoderService.encode(worker_id: worker.id)
            session = SessionResource.build(session_params(token, 'Successful authenticate!'))
            session.save
            render jsonapi: session, status: 201
        else
            render json: authenticate_error, status: :unauthorized
        end
    end

    def destroy
        session = SessionResource.all(filter: { token: request.headers['Authorization'].split(' ').last }).data.first
        session.destroy
        render jsonapi: session_params(nil, 'Logout!'), status: :ok
    end

    private

    def login_params
        params.require(:data).require(:attributes).permit(:username, :password)
    end

    def session_params(token, message)
        { 
            data: { 
                type: 'sessions',
                attributes: {
                    token: token,
                    message: message
                }
            } 
        }
    end

    def authenticate_error
        {
            "errors": [
                {
                "status": "401",
                "title": "Unauthorized",
                "detail": "Authentication failed"
                }
            ]
        }
    end

end