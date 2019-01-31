require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListGroupSUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        argument :get_all, Boolean, required: false
        argument :group_id, ID, required: true
        argument :search_term, String, required: false
        argument :include, String, required: false
        def resolve(group_id:, search_term: nil, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_GROUP_S_USERS").proxy(
            "LIST_GROUP_S_USERS",
            {
              "group_id": group_id,
              "search_term": search_term,
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