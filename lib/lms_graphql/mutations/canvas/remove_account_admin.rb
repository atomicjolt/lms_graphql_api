require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/admin"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveAccountAdmin < BaseMutation
        argument :account_id, ID, required: true
        argument :user_id, ID, required: true
        argument :role, String, required: false
        argument :role_id, ID, required: false
        field :admin, LMSGraphQL::Types::Canvas::CanvasAdmin, null: false
        def resolve(account_id:, user_id:, role: nil, role_id: nil)
          context[:canvas_api].call("REMOVE_ACCOUNT_ADMIN").proxy(
            "REMOVE_ACCOUNT_ADMIN",
            {
              "account_id": account_id,
              "user_id": user_id,
              "role": role,
              "role_id": role_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end