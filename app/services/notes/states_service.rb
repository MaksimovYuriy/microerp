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
    end
end