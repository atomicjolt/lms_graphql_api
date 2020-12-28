require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/outcome_link"
module LMSGraphQL
  module Mutations
    module Canvas
      class UnlinkOutcomeAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        argument :outcome_id, ID, required: true
        
        
        field :outcome_link, LMSGraphQL::Types::Canvas::CanvasOutcomeLink, null: false
        
        def resolve(account_id:, id:, outcome_id:)
          context[:canvas_api].call("UNLINK_OUTCOME_ACCOUNTS").proxy(
            "UNLINK_OUTCOME_ACCOUNTS",
            {
              "account_id": account_id,
              "id": id,
              "outcome_id": outcome_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end