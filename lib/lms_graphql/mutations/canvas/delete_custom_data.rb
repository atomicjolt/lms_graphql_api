require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteCustomDatum < BaseMutation
        argument :user_id, ID, required: true
        argument :ns, String, required: true
        field :return_value, Boolean, null: false
        def resolve(user_id:, ns:)
          context[:canvas_api].call("DELETE_CUSTOM_DATA").proxy(
            "DELETE_CUSTOM_DATA",
            {
              "user_id": user_id,
              "ns": ns
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end