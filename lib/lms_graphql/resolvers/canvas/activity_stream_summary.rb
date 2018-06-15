require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ActivityStreamSummary < CanvasBaseResolver
        type Boolean, null: false

        def resolve()
          context[:canvas_api].call("ACTIVITY_STREAM_SUMMARY").proxy(
            "ACTIVITY_STREAM_SUMMARY",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end