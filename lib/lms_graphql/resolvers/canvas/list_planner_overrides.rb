require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_override"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPlannerOverride < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasPlannerOverride], null: false
        argument :get_all, Boolean, required: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("LIST_PLANNER_OVERRIDES").proxy(
            "LIST_PLANNER_OVERRIDES",
            {
            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end