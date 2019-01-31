require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupsInGroupCategory < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroup], null: false
        argument :get_all, Boolean, required: false
        argument :group_category_id, ID, required: true
        def resolve(group_category_id:, get_all: false)
          result = context[:canvas_api].call("LIST_GROUPS_IN_GROUP_CATEGORY").proxy(
            "LIST_GROUPS_IN_GROUP_CATEGORY",
            {
              "group_category_id": group_category_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end