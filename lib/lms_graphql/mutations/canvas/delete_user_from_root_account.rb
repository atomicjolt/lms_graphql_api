require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteUserFromRootAccount < CanvasBaseMutation
        argument :account_id, ID, required: true
        argument :user_id, ID, required: true
        field :user, LMSGraphQL::Types::Canvas::CanvasUser, null: false
        def resolve(account_id:, user_id:)
          ctx[:canvas_api].proxy(
            "DELETE_USER_FROM_ROOT_ACCOUNT",
            {
              "account_id": account_id,
              "user_id": user_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end