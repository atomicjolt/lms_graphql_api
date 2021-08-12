require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_note"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPlannerNote < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasPlannerNote], null: false
        argument :get_all, Boolean, required: false
        argument :start_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :context_codes, [String], required: false
        def resolve(start_date: nil, end_date: nil, context_codes: nil, get_all: false)
          result = context[:canvas_api].call("LIST_PLANNER_NOTES").proxy(
            "LIST_PLANNER_NOTES",
            {
              "start_date": start_date,
              "end_date": end_date,
              "context_codes": context_codes            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end