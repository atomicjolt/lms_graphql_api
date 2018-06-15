require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group_category"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupCategoriesForContextCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroupCategory], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].call("LIST_GROUP_CATEGORIES_FOR_CONTEXT_COURSES").proxy(
            "LIST_GROUP_CATEGORIES_FOR_CONTEXT_COURSES",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end