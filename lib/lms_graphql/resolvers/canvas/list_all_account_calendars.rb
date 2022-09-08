require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account_calendar"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAllAccountCalendar < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasAccountCalendar], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :search_term, String, required: false
        argument :filter, String, required: false
        def resolve(account_id:, search_term: nil, filter: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ALL_ACCOUNT_CALENDARS").proxy(
            "LIST_ALL_ACCOUNT_CALENDARS",
            {
              "account_id": account_id,
              "search_term": search_term,
              "filter": filter            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end