require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/account"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateNewSubAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :account_name, String, required: true
        argument :account_sis_account_id, String, required: false
        argument :account_default_storage_quota_mb, Int, required: false
        argument :account_default_user_storage_quota_mb, Int, required: false
        argument :account_default_group_storage_quota_mb, Int, required: false
        
        
        field :account, LMSGraphQL::Types::Canvas::CanvasAccount, null: false
        
        def resolve(account_id:, account_name:, account_sis_account_id: nil, account_default_storage_quota_mb: nil, account_default_user_storage_quota_mb: nil, account_default_group_storage_quota_mb: nil)
          context[:canvas_api].call("CREATE_NEW_SUB_ACCOUNT").proxy(
            "CREATE_NEW_SUB_ACCOUNT",
            {
              "account_id": account_id
            },
            {
              "account[name]": account_name,
              "account[sis_account_id]": account_sis_account_id,
              "account[default_storage_quota_mb]": account_default_storage_quota_mb,
              "account[default_user_storage_quota_mb]": account_default_user_storage_quota_mb,
              "account[default_group_storage_quota_mb]": account_default_group_storage_quota_mb
            },
          ).parsed_response
        end
      end
    end
  end
end