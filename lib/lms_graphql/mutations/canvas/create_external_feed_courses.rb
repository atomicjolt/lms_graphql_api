require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/external_feed"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateExternalFeedCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :url, String, required: true
        argument :header_match, Boolean, required: false
        argument :verbosity, String, required: false
        
        
        field :external_feed, LMSGraphQL::Types::Canvas::CanvasExternalFeed, null: false
        
        def resolve(course_id:, url:, header_match: nil, verbosity: nil)
          context[:canvas_api].call("CREATE_EXTERNAL_FEED_COURSES").proxy(
            "CREATE_EXTERNAL_FEED_COURSES",
            {
              "course_id": course_id
            },
            {
              "url": url,
              "header_match": header_match,
              "verbosity": verbosity
            },
          ).parsed_response
        end
      end
    end
  end
end