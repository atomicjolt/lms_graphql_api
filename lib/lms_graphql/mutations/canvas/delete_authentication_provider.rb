require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteAuthenticationProvider < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(account_id:, id:)
          context[:canvas_api].call("DELETE_AUTHENTICATION_PROVIDER").proxy(
            "DELETE_AUTHENTICATION_PROVIDER",
            {
              "account_id": account_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end