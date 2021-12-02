require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class AddMultipleAllowedDomainsToAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :domains, [String], required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(account_id:, domains:)
          context[:canvas_api].call("ADD_MULTIPLE_ALLOWED_DOMAINS_TO_ACCOUNT").proxy(
            "ADD_MULTIPLE_ALLOWED_DOMAINS_TO_ACCOUNT",
            {
              "account_id": account_id
            },
            {
              "domains": domains
            },
          ).parsed_response
        end
      end
    end
  end
end