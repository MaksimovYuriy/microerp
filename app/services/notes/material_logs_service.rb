module Notes
    class MaterialLogsService

        def initialize(note)
            @note = note
        end

        def call
            service_materials = @note.service.service_materials
            service_materials.find_each do |sm|
                ServiceMaterialLog.create!(
                    service_material: sm,
                    date: DateTime.current
                )
            end
        end
    end
end