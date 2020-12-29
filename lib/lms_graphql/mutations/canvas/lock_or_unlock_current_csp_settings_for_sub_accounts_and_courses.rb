require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class LockOrUnlockCurrentCspSettingsForSubAccountsAndCourse < BaseMutation
        argument :account_id, ID, required: true
        argument :settings_locked, Boolean, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(account_id:, settings_locked:)
          context[:canvas_api].call("LOCK_OR_UNLOCK_CURRENT_CSP_SETTINGS_FOR_SUB_ACCOUNTS_AND_COURSES").proxy(
            "LOCK_OR_UNLOCK_CURRENT_CSP_SETTINGS_FOR_SUB_ACCOUNTS_AND_COURSES",
            {
              "account_id": account_id
            },
            {
              "settings_locked": settings_locked
            },
          ).parsed_response
        end
      end
    end
  end
end