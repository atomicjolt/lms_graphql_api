require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class EditExternalToolAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :external_tool_id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(account_id:, external_tool_id:)
          context[:canvas_api].call("EDIT_EXTERNAL_TOOL_ACCOUNTS").proxy(
            "EDIT_EXTERNAL_TOOL_ACCOUNTS",
            {
              "account_id": account_id,
              "external_tool_id": external_tool_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end