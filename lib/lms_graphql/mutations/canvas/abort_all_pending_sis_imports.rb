require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class AbortAllPendingSisImport < BaseMutation
        argument :account_id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(account_id:)
          context[:canvas_api].call("ABORT_ALL_PENDING_SIS_IMPORTS").proxy(
            "ABORT_ALL_PENDING_SIS_IMPORTS",
            {
              "account_id": account_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end