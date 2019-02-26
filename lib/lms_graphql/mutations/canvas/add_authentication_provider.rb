require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/authentication_provider"
module LMSGraphQL
  module Mutations
    module Canvas
      class AddAuthenticationProvider < BaseMutation
        argument :account_id, ID, required: true
        field :authentication_provider, LMSGraphQL::Types::Canvas::CanvasAuthenticationProvider, null: false
        def resolve(account_id:)
          context[:canvas_api].call("ADD_AUTHENTICATION_PROVIDER").proxy(
            "ADD_AUTHENTICATION_PROVIDER",
            {
              "account_id": account_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end