require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/module_item"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowModuleItem < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasModuleItem, null: false
        argument :course_id, ID, required: true
        argument :module_id, ID, required: true
        argument :id, ID, required: true
        argument :include, String, required: false
        argument :student_id, ID, required: false
        def resolve(course_id:, module_id:, id:, include: nil, student_id: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_MODULE_ITEM").proxy(
            "SHOW_MODULE_ITEM",
            {
              "course_id": course_id,
              "module_id": module_id,
              "id": id,
              "include": include,
              "student_id": student_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end