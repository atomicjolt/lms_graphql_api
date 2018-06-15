require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class HideStreamItem < BaseMutation
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(id:)
          context[:canvas_api].call("HIDE_STREAM_ITEM").proxy(
            "HIDE_STREAM_ITEM",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end