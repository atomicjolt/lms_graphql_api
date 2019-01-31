require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasGroup, null: false
        argument :group_id, ID, required: true
        argument :include, String, required: false
        def resolve(group_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_GROUP").proxy(
            "GET_SINGLE_GROUP",
            {
              "group_id": group_id,
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