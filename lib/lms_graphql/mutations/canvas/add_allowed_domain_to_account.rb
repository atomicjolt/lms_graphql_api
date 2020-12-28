require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class AddAllowedDomainToAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :domain, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(account_id:, domain:)
          context[:canvas_api].call("ADD_ALLOWED_DOMAIN_TO_ACCOUNT").proxy(
            "ADD_ALLOWED_DOMAIN_TO_ACCOUNT",
            {
              "account_id": account_id
            },
            {
              "domain": domain
            },
          ).parsed_response
        end
      end
    end
  end
end