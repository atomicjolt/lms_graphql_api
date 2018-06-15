require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Resolvers
    module Canvas
      class QueryProgress < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::Progress, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].proxy(
            "QUERY_PROGRESS",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end