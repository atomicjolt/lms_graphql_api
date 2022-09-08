require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blackout_date"
module LMSGraphQL
  module Resolvers
    module Canvas
      class NewBlackoutDateAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasBlackoutDate, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("NEW_BLACKOUT_DATE_ACCOUNTS").proxy(
            "NEW_BLACKOUT_DATE_ACCOUNTS",
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