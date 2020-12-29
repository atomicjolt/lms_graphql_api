require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class EnableDisableOrClearExplicitCspSettingAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :status, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(account_id:, status:)
          context[:canvas_api].call("ENABLE_DISABLE_OR_CLEAR_EXPLICIT_CSP_SETTING_ACCOUNTS").proxy(
            "ENABLE_DISABLE_OR_CLEAR_EXPLICIT_CSP_SETTING_ACCOUNTS",
            {
              "account_id": account_id
            },
            {
              "status": status
            },
          ).parsed_response
        end
      end
    end
  end
end