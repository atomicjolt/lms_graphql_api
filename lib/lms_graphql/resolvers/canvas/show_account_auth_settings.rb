require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/sso_setting"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowAccountAuthSetting < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasSSOSetting, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("SHOW_ACCOUNT_AUTH_SETTINGS").proxy(
            "SHOW_ACCOUNT_AUTH_SETTINGS",
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