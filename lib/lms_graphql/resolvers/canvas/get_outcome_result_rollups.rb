require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetOutcomeResultRollup < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :aggregate, String, required: false
        argument :aggregate_stat, String, required: false
        argument :user_ids, [ID], required: false
        argument :outcome_ids, [ID], required: false
        argument :include, [String], required: false
        argument :exclude, [String], required: false
        argument :sort_by, String, required: false
        argument :sort_outcome_id, ID, required: false
        argument :sort_order, String, required: false
        argument :add_defaults, Boolean, required: false
        def resolve(course_id:, aggregate: nil, aggregate_stat: nil, user_ids: nil, outcome_ids: nil, include: nil, exclude: nil, sort_by: nil, sort_outcome_id: nil, sort_order: nil, add_defaults: nil, get_all: false)
          result = context[:canvas_api].call("GET_OUTCOME_RESULT_ROLLUPS").proxy(
            "GET_OUTCOME_RESULT_ROLLUPS",
            {
              "course_id": course_id,
              "aggregate": aggregate,
              "aggregate_stat": aggregate_stat,
              "user_ids": user_ids,
              "outcome_ids": outcome_ids,
              "include": include,
              "exclude": exclude,
              "sort_by": sort_by,
              "sort_outcome_id": sort_outcome_id,
              "sort_order": sort_order,
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