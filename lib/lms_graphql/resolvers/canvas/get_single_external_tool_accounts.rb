require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleExternalToolAccount < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        argument :external_tool_id, ID, required: true
        def resolve(account_id:, external_tool_id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_EXTERNAL_TOOL_ACCOUNTS").proxy(
            "GET_SINGLE_EXTERNAL_TOOL_ACCOUNTS",
            {
              "account_id": account_id,
              "external_tool_id": external_tool_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end