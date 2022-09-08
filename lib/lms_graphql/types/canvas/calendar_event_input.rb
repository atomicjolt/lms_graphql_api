require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCalendarEventInput < BaseInputObject
          description "Calendar Events. API Docs: https://canvas.instructure.com/doc/api/calendar_events.html"
        argument :id, ID, "The ID of the calendar event.Example: 234", required: false
        argument :title, String, "The title of the calendar event.Example: Paintball Fight!", required: false
        argument :start_at, GraphQL::Types::ISO8601DateTime, "The start timestamp of the event.Example: 2012-07-19T15:00:00-06:00", required: false
        argument :end_at, GraphQL::Types::ISO8601DateTime, "The end timestamp of the event.Example: 2012-07-19T16:00:00-06:00", required: false
        argument :description, String, "The HTML description of the event.Example: <b>It's that time again!</b>", required: false
        argument :location_name, String, "The location name of the event.Example: Greendale Community College", required: false
        argument :location_address, String, "The address where the event is taking place.Example: Greendale, Colorado", required: false
        argument :context_code, String, "the context code of the calendar this event belongs to (course, user or group).Example: course_123", required: false
        argument :effective_context_code, String, "if specified, it indicates which calendar this event should be displayed on. for example, a section-level event would have the course's context code here, while the section's context code would be returned above).", required: false
        argument :context_name, String, "the context name of the calendar this event belongs to (course, user or group).Example: Chemistry 101", required: false
        argument :all_context_codes, String, "a comma-separated list of all calendar contexts this event is part of.Example: course_123,course_456", required: false
        argument :workflow_state, String, "Current state of the event ('active', 'locked' or 'deleted') 'locked' indicates that start_at/end_at cannot be changed (though the event could be deleted). Normally only reservations or time slots with reservations are locked (see the Appointment Groups API).Example: active", required: false
        argument :hidden, Boolean, "Whether this event should be displayed on the calendar. Only true for course-level events with section-level child events..", required: false
        argument :parent_event_id, ID, "Normally null. If this is a reservation (see the Appointment Groups API), the id will indicate the time slot it is for. If this is a section-level event, this will be the course-level parent event..", required: false
        argument :child_events_count, Int, "The number of child_events. See child_events (and parent_event_id).Example: 0", required: false
        argument :child_events, [Int], "Included by default, but may be excluded (see include[] option). If this is a time slot (see the Appointment Groups API) this will be a list of any reservations. If this is a course-level event, this will be a list of section-level events (if any).", required: false
        argument :url, String, "URL for this calendar event (to update, delete, etc.).Example: https://example.com/api/v1/calendar_events/234", required: false
        argument :html_url, String, "URL for a user to view this event.Example: https://example.com/calendar?event_id=234&include_contexts=course_123", required: false
        argument :all_day_date, GraphQL::Types::ISO8601DateTime, "The date of this event.Example: 2012-07-19", required: false
        argument :all_day, Boolean, "Boolean indicating whether this is an all-day event (midnight to midnight).", required: false
        argument :created_at, GraphQL::Types::ISO8601DateTime, "When the calendar event was created.Example: 2012-07-12T10:55:20-06:00", required: false
        argument :updated_at, GraphQL::Types::ISO8601DateTime, "When the calendar event was last updated.Example: 2012-07-12T10:55:20-06:00", required: false
        argument :appointment_group_id, ID, "Various Appointment-Group-related fields.These fields are only pertinent to time slots (appointments) and reservations of those time slots. See the Appointment Groups API. The id of the appointment group.", required: false
        argument :appointment_group_url, String, "The API URL of the appointment group.", required: false
        argument :own_reservation, Boolean, "If the event is a reservation, this a boolean indicating whether it is the current user's reservation, or someone else's.", required: false
        argument :reserve_url, String, "If the event is a time slot, the API URL for reserving it.", required: false
        argument :reserved, Boolean, "If the event is a time slot, a boolean indicating whether the user has already made a reservation for it.", required: false
        argument :participant_type, String, "The type of participant to sign up for a slot: 'User' or 'Group'.Example: User", required: false
        argument :participants_per_appointment, Int, "If the event is a time slot, this is the participant limit.", required: false
        argument :available_slots, Int, "If the event is a time slot and it has a participant limit, an integer indicating how many slots are available.", required: false
        argument :user, String, "If the event is a user-level reservation, this will contain the user participant JSON (refer to the Users API)..", required: false
        argument :group, String, "If the event is a group-level reservation, this will contain the group participant JSON (refer to the Groups API)..", required: false
        argument :important_dates, Boolean, "Boolean indicating whether this has important dates..Example: true", required: false
        argument :series_uuid, String, "Identifies the recurring event series this event may belong to.", required: false
        argument :rrule, String, "An iCalendar RRULE for defining how events in a recurring event series repeat..", required: false
        argument :series_natural_language, String, "A natural language expression of how events occur in the series. (e.g. Daily, 2 times).", required: false
        argument :blackout_date, Boolean, "Boolean indicating whether this has blackout date..Example: true", required: false

      end
    end
  end
end