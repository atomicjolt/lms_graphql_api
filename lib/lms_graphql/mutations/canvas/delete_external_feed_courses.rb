require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/external_feed"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteExternalFeedCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :external_feed_id, ID, required: true
        field :external_feed, LMSGraphQL::Types::Canvas::CanvasExternalFeed, null: false
        def resolve(course_id:, external_feed_id:)
          context[:canvas_api].call("DELETE_EXTERNAL_FEED_COURSES").proxy(
            "DELETE_EXTERNAL_FEED_COURSES",
            {
              "course_id": course_id,
              "external_feed_id": external_feed_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end