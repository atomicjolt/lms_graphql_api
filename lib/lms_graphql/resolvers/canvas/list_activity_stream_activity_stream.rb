require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListActivityStreamActivityStream < CanvasBaseResolver
        type Boolean, null: false
        argument :only_active_courses, Boolean, required: false
        def resolve(only_active_courses: nil)
          context[:canvas_api].call("LIST_ACTIVITY_STREAM_ACTIVITY_STREAM").proxy(
            "LIST_ACTIVITY_STREAM_ACTIVITY_STREAM",
            {
              "only_active_courses": only_active_courses            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end