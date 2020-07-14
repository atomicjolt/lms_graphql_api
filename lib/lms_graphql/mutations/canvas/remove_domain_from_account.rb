require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveDomainFromAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :domain, String, required: true
        field :return_value, Boolean, null: false
        def resolve(account_id:, domain:)
          context[:canvas_api].call("REMOVE_DOMAIN_FROM_ACCOUNT").proxy(
            "REMOVE_DOMAIN_FROM_ACCOUNT",
            {
              "account_id": account_id,
              "domain": domain
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end