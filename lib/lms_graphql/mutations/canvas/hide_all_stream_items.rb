require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class HideAllStreamItem < BaseMutation

        
        
        field :return_value, Boolean, null: false
        
        def resolve()
          context[:canvas_api].call("HIDE_ALL_STREAM_ITEMS").proxy(
            "HIDE_ALL_STREAM_ITEMS",
            {},
            {},
          ).parsed_response
        end
      end
    end
  end
end