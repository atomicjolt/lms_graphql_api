require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAppointment < BaseType
        description "Appointment Groups. API Docs: https://canvas.instructure.com/doc/api/appointment_groups.html"
      	field :id, ID, "The appointment identifier..Example: 987", null: true
      	field :start_at, LMSGraphQL::Types::DateTimeType, "Start time for the appointment.Example: 2012-07-20T15:00:00-06:00", null: true
      	field :end_at, LMSGraphQL::Types::DateTimeType, "End time for the appointment.Example: 2012-07-20T15:00:00-06:00", null: true

      end
    end
  end
end