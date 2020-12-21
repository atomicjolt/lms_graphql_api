require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class AddToolToRceFavorite < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(account_id:, id:)
          context[:canvas_api].call("ADD_TOOL_TO_RCE_FAVORITES").proxy(
            "ADD_TOOL_TO_RCE_FAVORITES",
            {
              "account_id": account_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end