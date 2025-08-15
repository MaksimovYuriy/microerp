module Notes
    class CancelService
        
        def initialize(note, current_worker)
            @note = note
            @current_worker = current_worker
        end

        def call
            CanceledService.create!(
                service: @note.service,
                client: @note.client,
                worker: @current_worker,
                date: @note.date
            )
        end

    end
end