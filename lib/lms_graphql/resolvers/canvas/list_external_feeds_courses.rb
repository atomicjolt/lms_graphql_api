require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/external_feed"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListExternalFeedsCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasExternalFeed], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        def resolve(course_id:, get_all: false)
          result = context[:canvas_api].call("LIST_EXTERNAL_FEEDS_COURSES").proxy(
            "LIST_EXTERNAL_FEEDS_COURSES",
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