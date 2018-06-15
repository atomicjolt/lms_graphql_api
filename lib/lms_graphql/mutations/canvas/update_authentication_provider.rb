require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/authentication_provider"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateAuthenticationProvider < CanvasBaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        field :authentication_provider, LMSGraphQL::Types::Canvas::CanvasAuthenticationProvider, null: false
        def resolve(account_id:, id:)
          context[:canvas_api].call("UPDATE_AUTHENTICATION_PROVIDER").proxy(
            "UPDATE_AUTHENTICATION_PROVIDER",
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