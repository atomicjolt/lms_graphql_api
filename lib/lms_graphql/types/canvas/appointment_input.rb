require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAppointmentInput < BaseInputObject
          description "Appointment Groups. API Docs: https://canvas.instructure.com/doc/api/appointment_groups.html"
        argument :id, ID, "The appointment identifier..Example: 987", required: false
        argument :start_at, GraphQL::Types::ISO8601DateTime, "Start time for the appointment.Example: 2012-07-20T15:00:00-06:00", required: false
        argument :end_at, GraphQL::Types::ISO8601DateTime, "End time for the appointment.Example: 2012-07-20T15:00:00-06:00", required: false

      end
    end
  end
end