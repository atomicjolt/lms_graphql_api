require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPlannerItem < CanvasBaseResolver
        type Boolean, null: false
        argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
        argument :end_date, GraphQL::Types::ISO8601DateTime, required: false
        argument :context_codes, String, required: false
        argument :filter, String, required: false
        def resolve(start_date: nil, end_date: nil, context_codes: nil, filter: nil, get_all: false)
          result = context[:canvas_api].call("LIST_PLANNER_ITEMS").proxy(
            "LIST_PLANNER_ITEMS",
            {
              "start_date": start_date,
              "end_date": end_date,
              "context_codes": context_codes,
              "filter": filter            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end