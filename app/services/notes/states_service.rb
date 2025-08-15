module Notes
    class StatesService
        attr_reader :errors

        ACTIONS = [:start, :complete, :cancel].freeze

        def initialize(note, action)
            @note = note
            @action = action.to_sym
            @errors = []
        end

        def call
            validate!
            @note.public_send("#{@action.to_s}!")
            execute_trigger(@action)

            debugger

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
                # PriceService
                # PerformedService
                # BonusesService
            when :cancel
                # CanceledService
            end
        end
    end
end