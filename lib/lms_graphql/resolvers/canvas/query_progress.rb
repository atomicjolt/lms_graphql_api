require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Resolvers
    module Canvas
      class QueryProgress < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("QUERY_PROGRESS").proxy(
            "QUERY_PROGRESS",
            {
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end