require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/developer_key"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdatePublicJwk < BaseMutation
        argument :public_jwk, String, required: true
        
        
        field :developer_key, LMSGraphQL::Types::Canvas::CanvasDeveloperKey, null: false
        
        def resolve(public_jwk:)
          context[:canvas_api].call("UPDATE_PUBLIC_JWK").proxy(
            "UPDATE_PUBLIC_JWK",
            {},
            {
              "public_jwk": public_jwk
            },
          ).parsed_response
        end
      end
    end
  end
end