require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteSubAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        field :account, LMSGraphQL::Types::Canvas::CanvasAccount, null: false
        def resolve(account_id:, id:)
          context[:canvas_api].call("DELETE_SUB_ACCOUNT").proxy(
            "DELETE_SUB_ACCOUNT",
            {
              "account_id": account_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end