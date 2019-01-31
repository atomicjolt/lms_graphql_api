require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GroupActivityStreamSummary < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        def resolve(group_id:, get_all: false)
          result = context[:canvas_api].call("GROUP_ACTIVITY_STREAM_SUMMARY").proxy(
            "GROUP_ACTIVITY_STREAM_SUMMARY",
            {
              "group_id": group_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end