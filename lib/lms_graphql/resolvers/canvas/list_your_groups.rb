require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListYourGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroup], null: false
        argument :context_type, String, required: false
        argument :include, String, required: false
        def resolve(context_type: nil, include: nil)
          context[:canvas_api].proxy(
            "LIST_YOUR_GROUPS",
            {
              "context_type": context_type,
              "include": include            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end