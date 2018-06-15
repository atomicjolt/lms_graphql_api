require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListLiveAssessment < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        def resolve(course_id:)
          context[:canvas_api].call("LIST_LIVE_ASSESSMENTS").proxy(
            "LIST_LIVE_ASSESSMENTS",
            {
              "course_id": course_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end