require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListTopicEntriesGroup < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        def resolve(group_id:, topic_id:, get_all: false)
          result = context[:canvas_api].call("LIST_TOPIC_ENTRIES_GROUPS").proxy(
            "LIST_TOPIC_ENTRIES_GROUPS",
            {
              "group_id": group_id,
              "topic_id": topic_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end