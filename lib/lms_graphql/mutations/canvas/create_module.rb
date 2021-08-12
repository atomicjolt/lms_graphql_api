require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/module"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateModule < BaseMutation
        argument :course_id, ID, required: true
        argument :module_name, String, required: true
        argument :module_unlock_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :module_position, Int, required: false
        argument :module_require_sequential_progress, Boolean, required: false
        argument :module_prerequisite_module_ids, [String], required: false
        argument :module_publish_final_grade, Boolean, required: false
        
        
        field :module, LMSGraphQL::Types::Canvas::CanvasModule, null: false, resolver_method: :resolve_module
        def resolve_module
          object[:module]
        end
        
        def resolve(course_id:, module_name:, module_unlock_at: nil, module_position: nil, module_require_sequential_progress: nil, module_prerequisite_module_ids: nil, module_publish_final_grade: nil)
          context[:canvas_api].call("CREATE_MODULE").proxy(
            "CREATE_MODULE",
            {
              "course_id": course_id
            },
            {
              "module[name]": module_name,
              "module[unlock_at]": module_unlock_at,
              "module[position]": module_position,
              "module[require_sequential_progress]": module_require_sequential_progress,
              "module[prerequisite_module_ids]": module_prerequisite_module_ids,
              "module[publish_final_grade]": module_publish_final_grade
            },
          ).parsed_response
        end
      end
    end
  end
end