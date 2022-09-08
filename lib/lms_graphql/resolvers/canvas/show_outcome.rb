require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/outcome"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowOutcome < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasOutcome, null: false
        argument :id, ID, required: true
        argument :add_defaults, Boolean, required: false
        def resolve(id:, add_defaults: nil, get_all: false)
          result = context[:canvas_api].call("SHOW_OUTCOME").proxy(
            "SHOW_OUTCOME",
            {
              "id": id,
              "add_defaults": add_defaults            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end