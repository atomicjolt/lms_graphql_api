require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListEntriesGroup < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :ids, [String], required: false
        def resolve(group_id:, topic_id:, ids: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ENTRIES_GROUPS").proxy(
            "LIST_ENTRIES_GROUPS",
            {
              "group_id": group_id,
              "topic_id": topic_id,
              "ids": ids            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end