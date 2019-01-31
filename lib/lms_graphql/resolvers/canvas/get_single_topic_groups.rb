require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleTopicGroup < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        argument :topic_id, ID, required: true
        argument :include, String, required: false
        def resolve(group_id:, topic_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_TOPIC_GROUPS").proxy(
            "GET_SINGLE_TOPIC_GROUPS",
            {
              "group_id": group_id,
              "topic_id": topic_id,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end