module Notes
    class StatesService
        attr_reader :errors

        ACTIONS = [:start, :complete, :cancel].freeze

        def initialize(note, action, current_user: nil)
            @note = note
            @action = action.to_sym
            @errors = []
            @current_user = current_user
        end

        def call
            validate!
            @note.public_send("#{@action.to_s}!")
            execute_trigger(@action)

            true
        rescue StandardError => e
            @errors << e.message
            false
        end

        private

        def validate!
            unless ACTIONS.include?(@action)
                raise 'Incorrect action!'
            end
        end

        def execute_trigger(action)
            case action
            when :start
                Notes::MaterialLogsService.new(@note).call
            when :complete
                total_price = Notes::PriceService.new(@note).call
                Notes::PerformService.new(@note, total_price, @current_user).call
            when :cancel
                Notes::CancelService.new(@note, @current_user).call
            end
        end
    end
end