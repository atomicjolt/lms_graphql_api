require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_group"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteOutcomeGroupAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        field :outcome_group, LMSGraphQL::Types::Canvas::CanvasOutcomeGroup, null: false
        def resolve(account_id:, id:)
          context[:canvas_api].call("DELETE_OUTCOME_GROUP_ACCOUNTS").proxy(
            "DELETE_OUTCOME_GROUP_ACCOUNTS",
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