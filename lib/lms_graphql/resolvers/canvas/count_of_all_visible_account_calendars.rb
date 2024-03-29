require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class CountOfAllVisibleAccountCalendar < CanvasBaseResolver
        type Int, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("COUNT_OF_ALL_VISIBLE_ACCOUNT_CALENDARS").proxy(
            "COUNT_OF_ALL_VISIBLE_ACCOUNT_CALENDARS",
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