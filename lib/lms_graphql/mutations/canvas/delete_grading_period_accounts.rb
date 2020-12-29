require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteGradingPeriodAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(account_id:, id:)
          context[:canvas_api].call("DELETE_GRADING_PERIOD_ACCOUNTS").proxy(
            "DELETE_GRADING_PERIOD_ACCOUNTS",
            {
              "account_id": account_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end