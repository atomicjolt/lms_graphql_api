require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateUserLogin < BaseMutation
        argument :account_id, ID, required: true
        argument :user_id, String, required: true
        argument :login_unique_id, String, required: true
        argument :login_password, String, required: false
        argument :login_sis_user_id, String, required: false
        argument :login_integration_id, String, required: false
        argument :login_authentication_provider_id, String, required: false
        argument :login_declared_user_type, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(account_id:, user_id:, login_unique_id:, login_password: nil, login_sis_user_id: nil, login_integration_id: nil, login_authentication_provider_id: nil, login_declared_user_type: nil)
          context[:canvas_api].call("CREATE_USER_LOGIN").proxy(
            "CREATE_USER_LOGIN",
            {
              "account_id": account_id
            },
            {
              "user[id]": user_id,
              "login[unique_id]": login_unique_id,
              "login[password]": login_password,
              "login[sis_user_id]": login_sis_user_id,
              "login[integration_id]": login_integration_id,
              "login[authentication_provider_id]": login_authentication_provider_id,
              "login[declared_user_type]": login_declared_user_type
            },
          ).parsed_response
        end
      end
    end
  end
end