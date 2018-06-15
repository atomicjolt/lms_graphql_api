require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/sso_setting"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateAccountAuthSetting < BaseMutation
        argument :account_id, ID, required: true
        field :sso_setting, LMSGraphQL::Types::Canvas::CanvasSSOSetting, null: false
        def resolve(account_id:)
          context[:canvas_api].call("UPDATE_ACCOUNT_AUTH_SETTINGS").proxy(
            "UPDATE_ACCOUNT_AUTH_SETTINGS",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end