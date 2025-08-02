class SessionsController < ApplicationController

    def create
        worker = Worker.find_by(username: login_params[:username])

        if worker&.authenticate(login_params[:password])
            token = JwtDecoderService.encode(worker_id: worker.id)
            context = OpenStruct.new(token: token, message: 'Success authentication!')
            render json: {
                data: {
                type: "sessions",
                id: nil,
                attributes: {
                    token: token,
                    message: "Successed authentication!"
                }
                }
            }
        else
            render json: {
                errors: [
                {
                    status: "401",
                    title: "Unauthorized",
                    detail: "Failed authentication!"
                }
                ]
            }, status: :unauthorized
        end
    end

    def destroy
        render json: {
                    data: {
                        type: "sessions",
                        id: nil,
                        attributes: {
                            token: nil,
                            message: "Logout!"
                        }
                    }
                }
    end

    private

    def login_params
        params.require(:data).require(:attributes).permit(:username, :password)
    end

end