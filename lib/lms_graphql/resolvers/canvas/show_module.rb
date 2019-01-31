require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/module"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowModule < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasModule, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :include, String, required: false
        argument :student_id, ID, required: false
        def resolve(course_id:, id:, include: nil, student_id: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_MODULE").proxy(
            "SHOW_MODULE",
            {
              "course_id": course_id,
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