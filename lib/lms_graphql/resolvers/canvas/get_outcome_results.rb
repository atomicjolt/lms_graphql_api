require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetOutcomeResult < CanvasBaseResolver
        type Boolean, null: false
        argument :course_id, ID, required: true
        argument :user_ids, [ID], required: false
        argument :outcome_ids, [ID], required: false
        argument :include, String, required: false
        argument :include_hidden, Boolean, required: false
        def resolve(course_id:, user_ids: nil, outcome_ids: nil, include: nil, include_hidden: nil, get_all: false)
          result = context[:canvas_api].call("GET_OUTCOME_RESULTS").proxy(
            "GET_OUTCOME_RESULTS",
            {
              "course_id": course_id,
              "user_ids": user_ids,
              "outcome_ids": outcome_ids,
              "include": include,
              "include_hidden": include_hidden            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end