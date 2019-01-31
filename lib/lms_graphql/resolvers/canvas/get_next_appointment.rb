require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/calendar_event"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetNextAppointment < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasCalendarEvent], null: false
        argument :get_all, Boolean, required: false
        argument :appointment_group_ids, [ID], required: false
        def resolve(appointment_group_ids: nil, get_all: false)
          result = context[:canvas_api].call("GET_NEXT_APPOINTMENT").proxy(
            "GET_NEXT_APPOINTMENT",
            {
              "appointment_group_ids": appointment_group_ids            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end