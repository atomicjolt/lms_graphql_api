require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/module"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListModule < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasModule], null: false
        argument :course_id, ID, required: true
        argument :include, String, required: false
        argument :search_term, String, required: false
        argument :student_id, ID, required: false
        def resolve(course_id:, include: nil, search_term: nil, student_id: nil)
          context[:canvas_api].call("LIST_MODULES").proxy(
            "LIST_MODULES",
            {
              "course_id": course_id,
              "include": include,
              "search_term": search_term,
              "student_id": student_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end