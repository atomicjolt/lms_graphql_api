require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Mutations
    module Canvas
      class AddObserveeWithCredential < BaseMutation
        argument :user_id, ID, required: true
        argument :observee_unique_id, String, required: false
        argument :observee_password, String, required: false
        argument :access_token, String, required: false
        argument :pairing_code, String, required: false
        argument :root_account_id, ID, required: false
        
        
        field :user, LMSGraphQL::Types::Canvas::CanvasUser, null: false
        
        def resolve(user_id:, observee_unique_id: nil, observee_password: nil, access_token: nil, pairing_code: nil, root_account_id: nil)
          context[:canvas_api].call("ADD_OBSERVEE_WITH_CREDENTIALS").proxy(
            "ADD_OBSERVEE_WITH_CREDENTIALS",
            {
              "user_id": user_id
            },
            {
              "observee[unique_id]": observee_unique_id,
              "observee[password]": observee_password,
              "access_token": access_token,
              "pairing_code": pairing_code,
              "root_account_id": root_account_id
            },
          ).parsed_response
        end
      end
    end
  end
end