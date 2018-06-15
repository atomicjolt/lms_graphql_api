require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class FindRecipient < CanvasBaseResolver
        type Boolean, null: false

        def resolve()
          context[:canvas_api].proxy(
            "FIND_RECIPIENTS",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end