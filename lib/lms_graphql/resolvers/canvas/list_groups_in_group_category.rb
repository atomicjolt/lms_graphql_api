require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupsInGroupCategory < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroup], null: false
        argument :group_category_id, ID, required: true
        def resolve(group_category_id:)
          context[:canvas_api].proxy(
            "LIST_GROUPS_IN_GROUP_CATEGORY",
            {
              "group_category_id": group_category_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end