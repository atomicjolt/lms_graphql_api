require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_category"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupCategoriesForContextCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroupCategory], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("LIST_GROUP_CATEGORIES_FOR_CONTEXT_COURSES").proxy(
            "LIST_GROUP_CATEGORIES_FOR_CONTEXT_COURSES",
            {
              "course_id": course_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end