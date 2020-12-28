require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/jwt"
module LMSGraphQL
  module Mutations
    module Canvas
      class RefreshJwt < BaseMutation
        argument :jwt, String, required: true
        
        
        field :jwt, LMSGraphQL::Types::Canvas::CanvasJWT, null: false
        
        def resolve(jwt:)
          context[:canvas_api].call("REFRESH_JWT").proxy(
            "REFRESH_JWT",
            {},
            {
              "jwt": jwt
            },
          ).parsed_response
        end
      end
    end
  end
end