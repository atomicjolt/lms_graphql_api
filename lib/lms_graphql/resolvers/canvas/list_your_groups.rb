require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/group"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListYourGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasGroup], null: false
        argument :get_all, Boolean, required: false
        argument :context_type, String, required: false
        argument :include, String, required: false
        def resolve(context_type: nil, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_YOUR_GROUPS").proxy(
            "LIST_YOUR_GROUPS",
            {
              "context_type": context_type,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end