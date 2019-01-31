require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListUpcomingAssignmentsCalendarEvent < CanvasBaseResolver
        type Boolean, null: false

        def resolve(get_all: false)
          result = context[:canvas_api].call("LIST_UPCOMING_ASSIGNMENTS_CALENDAR_EVENTS").proxy(
            "LIST_UPCOMING_ASSIGNMENTS_CALENDAR_EVENTS",
            {
            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end