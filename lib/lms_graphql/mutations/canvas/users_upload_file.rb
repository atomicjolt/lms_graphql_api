require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UsersUploadFile < BaseMutation
        argument :user_id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(user_id:)
          context[:canvas_api].call("USERS_UPLOAD_FILE").proxy(
            "USERS_UPLOAD_FILE",
            {
              "user_id": user_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end