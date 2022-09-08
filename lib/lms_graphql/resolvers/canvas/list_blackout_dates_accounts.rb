require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blackout_date"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListBlackoutDatesAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasBlackoutDate], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("LIST_BLACKOUT_DATES_ACCOUNTS").proxy(
            "LIST_BLACKOUT_DATES_ACCOUNTS",
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