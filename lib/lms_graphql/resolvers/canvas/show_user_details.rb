require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowUserDetail < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasUser, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].proxy(
            "SHOW_USER_DETAILS",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end