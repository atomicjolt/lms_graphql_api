require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListActivityStreamSelf < CanvasBaseResolver
        type Boolean, null: false
        argument :only_active_courses, Boolean, required: false
        def resolve(only_active_courses: nil)
          context[:canvas_api].call("LIST_ACTIVITY_STREAM_SELF").proxy(
            "LIST_ACTIVITY_STREAM_SELF",
            {
              "only_active_courses": only_active_courses            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end