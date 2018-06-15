require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Resolvers
    module Canvas
      class QueryProgress < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].call("QUERY_PROGRESS").proxy(
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