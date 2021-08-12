require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFileCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFile, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :include, [String], required: false
        def resolve(course_id:, id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_FILE_COURSES").proxy(
            "GET_FILE_COURSES",
            {
              "course_id": course_id,
              "id": id,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end