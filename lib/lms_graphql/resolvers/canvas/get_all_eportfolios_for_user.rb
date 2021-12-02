require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/e_portfolio"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetAllEportfoliosForUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasePortfolio], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        argument :include, [String], required: false
        def resolve(user_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_ALL_EPORTFOLIOS_FOR_USER").proxy(
            "GET_ALL_EPORTFOLIOS_FOR_USER",
            {
              "user_id": user_id,
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