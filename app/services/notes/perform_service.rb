module Notes
    class PerformService

        def initialize(note, total_price, current_worker)
            @note = note
            @total_price = total_price
            @current_worker = current_worker
        end

        def call
            PerformedService.create!(
                service: @note.service,
                client: @note.client,
                worker: @current_worker,
                date: @note.date,
                total_price: @total_price
            )
        end
    end
end