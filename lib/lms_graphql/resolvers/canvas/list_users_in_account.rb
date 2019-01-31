require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListUsersInAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :search_term, String, required: false
        argument :sort, String, required: false
        argument :order, String, required: false
        def resolve(account_id:, search_term: nil, sort: nil, order: nil, get_all: false)
          result = context[:canvas_api].call("LIST_USERS_IN_ACCOUNT").proxy(
            "LIST_USERS_IN_ACCOUNT",
            {
              "account_id": account_id,
              "search_term": search_term,
              "sort": sort,
              "order": order            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end