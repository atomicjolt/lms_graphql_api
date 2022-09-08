require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account_calendar"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleAccountCalendar < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasAccountCalendar, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_ACCOUNT_CALENDAR").proxy(
            "GET_SINGLE_ACCOUNT_CALENDAR",
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