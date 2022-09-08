require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class QueryByUser < CanvasBaseResolver
        type Boolean, null: false
        argument :user_id, ID, required: true
        argument :start_time, GraphQL::Types::ISO8601DateTime, required: false
        argument :end_time, GraphQL::Types::ISO8601DateTime, required: false
        def resolve(user_id:, start_time: nil, end_time: nil, get_all: false)
          result = context[:canvas_api].call("QUERY_BY_USER").proxy(
            "QUERY_BY_USER",
            {
              "user_id": user_id,
              "start_time": start_time,
              "end_time": end_time            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end