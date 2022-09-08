require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account_calendar"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAvailableAccountCalendar < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAccountCalendar], null: false
        argument :get_all, Boolean, required: false
        argument :search_term, String, required: false
        def resolve(search_term: nil, get_all: false)
          result = context[:canvas_api].call("LIST_AVAILABLE_ACCOUNT_CALENDARS").proxy(
            "LIST_AVAILABLE_ACCOUNT_CALENDARS",
            {
              "search_term": search_term            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end