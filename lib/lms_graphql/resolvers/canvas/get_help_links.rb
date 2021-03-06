require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/help_link"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetHelpLink < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasHelpLink, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("GET_HELP_LINKS").proxy(
            "GET_HELP_LINKS",
            {
              "account_id": account_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end