require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class MarkAllAsRead < BaseMutation

        field :return_value, Boolean, null: false
        def resolve()
          context[:canvas_api].call("MARK_ALL_AS_READ").proxy(
            "MARK_ALL_AS_READ",
            {},
            {},
          ).parsed_response
        end
      end
    end
  end
end