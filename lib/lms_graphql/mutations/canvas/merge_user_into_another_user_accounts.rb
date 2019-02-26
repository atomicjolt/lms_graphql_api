require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Mutations
    module Canvas
      class MergeUserIntoAnotherUserAccount < BaseMutation
        argument :id, ID, required: true
        argument :destination_account_id, ID, required: true
        argument :destination_user_id, ID, required: true
        field :user, LMSGraphQL::Types::Canvas::CanvasUser, null: false
        def resolve(id:, destination_account_id:, destination_user_id:)
          context[:canvas_api].call("MERGE_USER_INTO_ANOTHER_USER_ACCOUNTS").proxy(
            "MERGE_USER_INTO_ANOTHER_USER_ACCOUNTS",
            {
              "id": id,
              "destination_account_id": destination_account_id,
              "destination_user_id": destination_user_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end