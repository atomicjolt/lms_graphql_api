require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/e_portfolio_page"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetEportfolioPage < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasePortfolioPage], null: false
        argument :get_all, Boolean, required: false
        argument :eportfolio_id, ID, required: true
        def resolve(eportfolio_id:, get_all: false)
          result = context[:canvas_api].call("GET_EPORTFOLIO_PAGES").proxy(
            "GET_EPORTFOLIO_PAGES",
            {
              "eportfolio_id": eportfolio_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end