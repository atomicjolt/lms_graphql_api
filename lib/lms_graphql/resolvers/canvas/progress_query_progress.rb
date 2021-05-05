require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ProgressQueryProgress < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, id:, get_all: false)
          result = context[:canvas_api].call("PROGRESS_QUERY_PROGRESS").proxy(
            "PROGRESS_QUERY_PROGRESS",
            {
              "course_id": course_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end