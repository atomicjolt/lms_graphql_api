require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteUserFromRootAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :user_id, ID, required: true
        
        
        field :user, LMSGraphQL::Types::Canvas::CanvasUser, null: false
        
        def resolve(account_id:, user_id:)
          context[:canvas_api].call("DELETE_USER_FROM_ROOT_ACCOUNT").proxy(
            "DELETE_USER_FROM_ROOT_ACCOUNT",
            {
              "account_id": account_id,
              "user_id": user_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end