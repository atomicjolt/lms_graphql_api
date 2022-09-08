require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListPlannerItemsUser < CanvasBaseResolver
        type Boolean, null: false
        argument :user_id, ID, required: true
        argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
        argument :end_date, GraphQL::Types::ISO8601DateTime, required: false
        argument :context_codes, [String], required: false
        argument :observed_user_id, ID, required: false
        argument :filter, String, required: false
        def resolve(user_id:, start_date: nil, end_date: nil, context_codes: nil, observed_user_id: nil, filter: nil, get_all: false)
          result = context[:canvas_api].call("LIST_PLANNER_ITEMS_USERS").proxy(
            "LIST_PLANNER_ITEMS_USERS",
            {
              "user_id": user_id,
              "start_date": start_date,
              "end_date": end_date,
              "context_codes": context_codes,
              "observed_user_id": observed_user_id,
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