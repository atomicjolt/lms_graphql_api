require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetCurrentSettingsForAccountOrCourseAccount < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("GET_CURRENT_SETTINGS_FOR_ACCOUNT_OR_COURSE_ACCOUNTS").proxy(
            "GET_CURRENT_SETTINGS_FOR_ACCOUNT_OR_COURSE_ACCOUNTS",
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