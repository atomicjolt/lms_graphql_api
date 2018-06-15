require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupSUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        argument :group_id, ID, required: true
        argument :search_term, String, required: false
        argument :include, String, required: false
        def resolve(group_id:, search_term: nil, include: nil)
          context[:canvas_api].proxy(
            "LIST_GROUP_S_USERS",
            {
              "group_id": group_id,
              "search_term": search_term,
              "include": include            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end