require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/e_portfolio"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetEportfolio < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasePortfolio, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("GET_EPORTFOLIO").proxy(
            "GET_EPORTFOLIO",
            {
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end