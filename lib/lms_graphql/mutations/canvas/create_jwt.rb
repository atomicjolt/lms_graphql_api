require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/jwt"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateJwt < CanvasBaseMutation

        field :jwt, LMSGraphQL::Types::Canvas::CanvasJWT, null: false
        def resolve()
          context[:canvas_api].call("CREATE_JWT").proxy(
            "CREATE_JWT",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end