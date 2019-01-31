require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/report"
module LMSGraphQL
  module Resolvers
    module Canvas
      class IndexOfReport < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasReport], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :report, String, required: true
        def resolve(account_id:, report:, get_all: false)
          result = context[:canvas_api].call("INDEX_OF_REPORTS").proxy(
            "INDEX_OF_REPORTS",
            {
              "account_id": account_id,
              "report": report            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end