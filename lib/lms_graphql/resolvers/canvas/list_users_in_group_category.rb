require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListUsersInGroupCategory < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        argument :group_category_id, ID, required: true
        argument :search_term, String, required: false
        argument :unassigned, Boolean, required: false
        def resolve(group_category_id:, search_term: nil, unassigned: nil)
          context[:canvas_api].call("LIST_USERS_IN_GROUP_CATEGORY").proxy(
            "LIST_USERS_IN_GROUP_CATEGORY",
            {
              "group_category_id": group_category_id,
              "search_term": search_term,
              "unassigned": unassigned            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end