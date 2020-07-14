require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowUserDetail < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasUser, null: false
        argument :id, ID, required: true
        argument :include, String, required: false
        def resolve(id:, include: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_USER_DETAILS").proxy(
            "SHOW_USER_DETAILS",
            {
              "id": id,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end