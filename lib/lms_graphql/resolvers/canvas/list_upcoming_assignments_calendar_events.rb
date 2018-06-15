require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListUpcomingAssignmentsCalendarEvent < CanvasBaseResolver
        type Boolean, null: false

        def resolve()
          context[:canvas_api].proxy(
            "LIST_UPCOMING_ASSIGNMENTS_CALENDAR_EVENTS",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end