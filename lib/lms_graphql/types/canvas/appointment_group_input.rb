require_relative "../canvas_base_input_type"
require_relative "appointment"
require_relative "calendar_event"
require_relative "calendar_event"

module LMSGraphQL
  module Types
    module Canvas
        class AppointmentGroupWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "pending"
          value "active"
          value "deleted"
        end

                class AppointmentGroupParticipantVisibilityEnum < ::GraphQL::Schema::Enum
          value "private"
          value "protected"
        end

                class AppointmentGroupParticipantTypeEnum < ::GraphQL::Schema::Enum
          value "User"
          value "Group"
        end
      class CanvasAppointmentGroupInput < BaseInputObject
        description "Appointment Groups. API Docs: https://canvas.instructure.com/doc/api/appointment_groups.html"
      	argument :id, ID, "The ID of the appointment group.Example: 543", required: false
      	argument :title, String, "The title of the appointment group.Example: Final Presentation", required: false
      	argument :start_at, LMSGraphQL::Types::DateTimeType, "The start of the first time slot in the appointment group.Example: 2012-07-20T15:00:00-06:00", required: false
      	argument :end_at, LMSGraphQL::Types::DateTimeType, "The end of the last time slot in the appointment group.Example: 2012-07-20T17:00:00-06:00", required: false
      	argument :description, String, "The text description of the appointment group.Example: Es muy importante", required: false
      	argument :location_name, String, "The location name of the appointment group.Example: El Tigre Chino's office", required: false
      	argument :location_address, String, "The address of the appointment group's location.Example: Room 234", required: false
      	argument :participant_count, Int, "The number of participant who have reserved slots (see include[] argument).Example: 2", required: false
      	argument :reserved_times, [LMSGraphQL::Types::Canvas::CanvasAppointmentInput], "The start and end times of slots reserved by the current user as well as the id of the calendar event for the reservation (see include[] argument).Example: {'id'=>987, 'start_at'=>'2012-07-20T15:00:00-06:00', 'end_at'=>'2012-07-20T15:00:00-06:00'}", required: false
      	argument :context_codes, String, "The context codes (i.e. courses) this appointment group belongs to. Only people in these courses will be eligible to sign up..Example: course_123", required: false
      	argument :sub_context_codes, Int, "The sub-context codes (i.e. course sections and group categories) this appointment group is restricted to.Example: course_section_234", required: false
      	argument :workflow_state, AppointmentGroupWorkflowStateEnum, "Current state of the appointment group ('pending', 'active' or 'deleted'). 'pending' indicates that it has not been published yet and is invisible to participants..Example: active", required: false
      	argument :requiring_action, Boolean, "Boolean indicating whether the current user needs to sign up for this appointment group (i.e. it's reservable and the min_appointments_per_participant limit has not been met by this user)..Example: true", required: false
      	argument :appointments_count, Int, "Number of time slots in this appointment group.Example: 2", required: false
      	argument :appointments, [LMSGraphQL::Types::Canvas::CanvasCalendarEventInput], "Calendar Events representing the time slots (see include[] argument) Refer to the Calendar Events API for more information.", required: false
      	argument :new_appointments, [LMSGraphQL::Types::Canvas::CanvasCalendarEventInput], "Newly created time slots (same format as appointments above). Only returned in Create/Update responses where new time slots have been added.", required: false
      	argument :max_appointments_per_participant, Int, "Maximum number of time slots a user may register for, or null if no limit.Example: 1", required: false
      	argument :min_appointments_per_participant, Int, "Minimum number of time slots a user must register for. If not set, users do not need to sign up for any time slots.Example: 1", required: false
      	argument :participants_per_appointment, Int, "Maximum number of participants that may register for each time slot, or null if no limit.Example: 1", required: false
      	argument :participant_visibility, AppointmentGroupParticipantVisibilityEnum, "'private' means participants cannot see who has signed up for a particular time slot, 'protected' means that they can.Example: private", required: false
      	argument :participant_type, AppointmentGroupParticipantTypeEnum, "Indicates how participants sign up for the appointment group, either as individuals ('User') or in student groups ('Group'). Related to sub_context_codes (i.e. 'Group' signups always have a single group category).Example: User", required: false
      	argument :url, String, "URL for this appointment group (to update, delete, etc.).Example: https://example.com/api/v1/appointment_groups/543", required: false
      	argument :html_url, String, "URL for a user to view this appointment group.Example: http://example.com/appointment_groups/1", required: false
      	argument :created_at, LMSGraphQL::Types::DateTimeType, "When the appointment group was created.Example: 2012-07-13T10:55:20-06:00", required: false
      	argument :updated_at, LMSGraphQL::Types::DateTimeType, "When the appointment group was last updated.Example: 2012-07-13T10:55:20-06:00", required: false

      end
    end
  end
end