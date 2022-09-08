require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/page_view"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListUserPageView < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasPageView], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        argument :start_time, GraphQL::Types::ISO8601DateTime, required: false
        argument :end_time, GraphQL::Types::ISO8601DateTime, required: false
        def resolve(user_id:, start_time: nil, end_time: nil, get_all: false)
          result = context[:canvas_api].call("LIST_USER_PAGE_VIEWS").proxy(
            "LIST_USER_PAGE_VIEWS",
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