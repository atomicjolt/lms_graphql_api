require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_note"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPlannerNote < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::PlannerNote], null: false
        argument :start_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :context_codes, String, required: false
        def resolve(start_date: nil, end_date: nil, context_codes: nil)
          context[:canvas_api].proxy(
            "LIST_PLANNER_NOTES",
            {
              "start_date": start_date,
              "end_date": end_date,
              "context_codes": context_codes            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end