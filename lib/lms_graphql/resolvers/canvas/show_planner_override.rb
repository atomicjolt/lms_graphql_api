require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_override"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowPlannerOverride < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPlannerOverride, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("SHOW_PLANNER_OVERRIDE").proxy(
            "SHOW_PLANNER_OVERRIDE",
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