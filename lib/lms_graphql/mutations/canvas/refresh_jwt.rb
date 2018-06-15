require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/jwt"
module LMSGraphQL
  module Mutations
    module Canvas
      class RefreshJwt < CanvasBaseMutation
        argument :jwt, String, required: true
        field :jwt, LMSGraphQL::Types::Canvas::CanvasJWT, null: false
        def resolve(jwt:)
          ctx[:canvas_api].proxy(
            "REFRESH_JWT",
            {
              "jwt": jwt            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end