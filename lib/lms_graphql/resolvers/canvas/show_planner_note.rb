require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_note"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowPlannerNote < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPlannerNote, null: false
        argument :id, ID, required: true
        def resolve(id:, get_all: false)
          result = context[:canvas_api].call("SHOW_PLANNER_NOTE").proxy(
            "SHOW_PLANNER_NOTE",
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