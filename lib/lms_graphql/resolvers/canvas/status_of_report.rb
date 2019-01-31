require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/report"
module LMSGraphQL
  module Resolvers
    module Canvas
      class StatusOfReport < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasReport, null: false
        argument :account_id, ID, required: true
        argument :report, String, required: true
        argument :id, ID, required: true
        def resolve(account_id:, report:, id:, get_all: false)
          result = context[:canvas_api].call("STATUS_OF_REPORT").proxy(
            "STATUS_OF_REPORT",
            {
              "account_id": account_id,
              "report": report,
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