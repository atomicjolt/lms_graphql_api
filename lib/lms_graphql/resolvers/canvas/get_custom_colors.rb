require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetCustomColor < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].call("GET_CUSTOM_COLORS").proxy(
            "GET_CUSTOM_COLORS",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end