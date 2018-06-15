require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_override"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPlannerOverride < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasPlannerOverride], null: false

        def resolve()
          context[:canvas_api].proxy(
            "LIST_PLANNER_OVERRIDES",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end