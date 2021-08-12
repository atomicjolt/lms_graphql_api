require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListAppointmentGroup < CanvasBaseResolver
        type Boolean, null: false
        argument :scope, String, required: false
        argument :context_codes, [String], required: false
        argument :include_past_appointments, Boolean, required: false
        argument :include, [String], required: false
        def resolve(scope: nil, context_codes: nil, include_past_appointments: nil, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_APPOINTMENT_GROUPS").proxy(
            "LIST_APPOINTMENT_GROUPS",
            {
              "scope": scope,
              "context_codes": context_codes,
              "include_past_appointments": include_past_appointments,
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