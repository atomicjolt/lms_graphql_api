require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/discussion_topic"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAnnouncement < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasDiscussionTopic], null: false
        argument :get_all, Boolean, required: false
        argument :context_codes, [String], required: true
        argument :start_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :active_only, Boolean, required: false
        argument :latest_only, Boolean, required: false
        argument :include, String, required: false
        def resolve(context_codes:, start_date: nil, end_date: nil, active_only: nil, latest_only: nil, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ANNOUNCEMENTS").proxy(
            "LIST_ANNOUNCEMENTS",
            {
              "context_codes": context_codes,
              "start_date": start_date,
              "end_date": end_date,
              "active_only": active_only,
              "latest_only": latest_only,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end