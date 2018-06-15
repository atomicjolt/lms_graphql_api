require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/role"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleRole < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasRole, null: false
        argument :id, ID, required: true
        argument :account_id, ID, required: true
        argument :role_id, ID, required: true
        argument :role, String, required: false
        def resolve(id:, account_id:, role_id:, role: nil)
          context[:canvas_api].call("GET_SINGLE_ROLE").proxy(
            "GET_SINGLE_ROLE",
            {
              "id": id,
              "account_id": account_id,
              "role_id": role_id,
              "role": role            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end