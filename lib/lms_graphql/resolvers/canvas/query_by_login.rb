require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class QueryByLogin < CanvasBaseResolver
        type Boolean, null: false
        argument :login_id, ID, required: true
        argument :start_time, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_time, LMSGraphQL::Types::DateTimeType, required: false
        def resolve(login_id:, start_time: nil, end_time: nil)
          context[:canvas_api].proxy(
            "QUERY_BY_LOGIN",
            {
              "login_id": login_id,
              "start_time": start_time,
              "end_time": end_time            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end