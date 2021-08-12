require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/calendar_event"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListCalendarEvent < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCalendarEvent], null: false
        argument :get_all, Boolean, required: false
        argument :type, String, required: false
        argument :start_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :undated, Boolean, required: false
        argument :all_events, Boolean, required: false
        argument :context_codes, [String], required: false
        argument :excludes, [String], required: false
        argument :important_dates, Boolean, required: false
        def resolve(type: nil, start_date: nil, end_date: nil, undated: nil, all_events: nil, context_codes: nil, excludes: nil, important_dates: nil, get_all: false)
          result = context[:canvas_api].call("LIST_CALENDAR_EVENTS").proxy(
            "LIST_CALENDAR_EVENTS",
            {
              "type": type,
              "start_date": start_date,
              "end_date": end_date,
              "undated": undated,
              "all_events": all_events,
              "context_codes": context_codes,
              "excludes": excludes,
              "important_dates": important_dates            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end