require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/account_notification"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowGlobalNotification < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasAccountNotification, null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        def resolve(account_id:, id:, get_all: false)
          result = context[:canvas_api].call("SHOW_GLOBAL_NOTIFICATION").proxy(
            "SHOW_GLOBAL_NOTIFICATION",
            {
              "account_id": account_id,
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