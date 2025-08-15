module Notes
    class PriceService
        SALE_RESTRICTION = 15

        def initialize(note)
            @note = note
            @sale = 0
            @default_price = @note.service.price
            @count_of_client_services = @note.client.performed_services.count
        end

        def call
            apply_sale_restriction!
            total_calculation
        end

        private

        def apply_sale_restriction!
            @sale = 10 if @count_of_client_services == 0
        end

        def total_calculation
            return @default_price * (100 - @sale) / 100
        end

    end
end