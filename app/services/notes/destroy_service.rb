module Notes
    class DestroyService
        
        def initialize(note)
            @note = note
        end

        def call
            @note.destroy!
        end

    end
end