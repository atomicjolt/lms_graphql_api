require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/admin"
module LMSGraphQL
  module Mutations
    module Canvas
      class MakeAccountAdmin < BaseMutation
        argument :account_id, ID, required: true
        argument :user_id, ID, required: true
        argument :role, String, required: false
        argument :role_id, ID, required: false
        argument :send_confirmation, Boolean, required: false
        
        
        field :admin, LMSGraphQL::Types::Canvas::CanvasAdmin, null: false
        
        def resolve(account_id:, user_id:, role: nil, role_id: nil, send_confirmation: nil)
          context[:canvas_api].call("MAKE_ACCOUNT_ADMIN").proxy(
            "MAKE_ACCOUNT_ADMIN",
            {
              "account_id": account_id
            },
            {
              "user_id": user_id,
              "role": role,
              "role_id": role_id,
              "send_confirmation": send_confirmation
            },
          ).parsed_response
        end
      end
    end
  end
end