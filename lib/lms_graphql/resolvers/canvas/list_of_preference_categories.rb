require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListOfPreferenceCategory < CanvasBaseResolver
        type Boolean, null: false
        argument :user_id, ID, required: true
        argument :communication_channel_id, ID, required: true
        def resolve(user_id:, communication_channel_id:, get_all: false)
          result = context[:canvas_api].call("LIST_OF_PREFERENCE_CATEGORIES").proxy(
            "LIST_OF_PREFERENCE_CATEGORIES",
            {
              "user_id": user_id,
              "communication_channel_id": communication_channel_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end