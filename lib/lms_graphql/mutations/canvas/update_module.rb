require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/module"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateModule < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :module_name, String, required: false
        argument :module_unlock_at, LMSGraphQL::Types::DateTimeType, required: false
        argument :module_position, Int, required: false
        argument :module_require_sequential_progress, Boolean, required: false
        argument :module_prerequisite_module_ids, String, required: false
        argument :module_publish_final_grade, Boolean, required: false
        argument :module_published, Boolean, required: false
        field :module, LMSGraphQL::Types::Canvas::CanvasModule, null: false
        def resolve(course_id:, id:, module_name: nil, module_unlock_at: nil, module_position: nil, module_require_sequential_progress: nil, module_prerequisite_module_ids: nil, module_publish_final_grade: nil, module_published: nil)
          context[:canvas_api].call("UPDATE_MODULE").proxy(
            "UPDATE_MODULE",
            {
              "course_id": course_id,
              "id": id,
              "module[name]": module_name,
              "module[unlock_at]": module_unlock_at,
              "module[position]": module_position,
              "module[require_sequential_progress]": module_require_sequential_progress,
              "module[prerequisite_module_ids]": module_prerequisite_module_ids,
              "module[publish_final_grade]": module_publish_final_grade,
              "module[published]": module_published            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end