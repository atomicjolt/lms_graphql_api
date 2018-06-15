require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/feature"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListFeaturesCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFeature], null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].call("LIST_FEATURES_COURSES").proxy(
            "LIST_FEATURES_COURSES",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end