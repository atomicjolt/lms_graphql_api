require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/external_feed"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListExternalFeedsCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasExternalFeed], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].proxy(
            "LIST_EXTERNAL_FEEDS_COURSES",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end