require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListRecentlyLoggedInStudent < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].call("LIST_RECENTLY_LOGGED_IN_STUDENTS").proxy(
            "LIST_RECENTLY_LOGGED_IN_STUDENTS",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end