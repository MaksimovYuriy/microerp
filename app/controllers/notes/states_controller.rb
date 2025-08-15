module Notes
    class StatesController < ApplicationController
        before_action :authenticate!

        def start
            note = Note.find(action_params[:id])

            note_states = Notes::StatesService.new(note, :start)

            if note_states.call
                render json: { data: { id: note.id, status: note.state }}
            else
                render json: { errors: note_states.errors }, status: :unprocessable_entity
            end
        end

        def complete
            note = Note.find(action_params[:id])

            note_states = Notes::StatesService.new(note, :complete, current_user: current_user)

            if note_states.call
                render json: { data: { id: note.id, status: note.state }}
            else
                render json: { errors: note_states.errors }, status: :unprocessable_entity
            end
        end

        def cancel
            note = Note.find(action_params[:id])

            note_states = Notes::StatesService.new(note, :cancel, current_user: current_user)

            if note_states.call
                render json: { data: { id: note.id, status: note.state }}
            else
                render json: { errors: note_states.errors }, status: :unprocessable_entity
            end
        end

        private

        def action_params
            params.require(:data).permit(:id)
        end
    end
end