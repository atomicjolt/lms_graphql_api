require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSectionInformationCourse < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasSection, null: false
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :include, [String], required: false
        def resolve(course_id:, id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_SECTION_INFORMATION_COURSES").proxy(
            "GET_SECTION_INFORMATION_COURSES",
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