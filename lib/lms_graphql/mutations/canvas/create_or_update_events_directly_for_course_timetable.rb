require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateOrUpdateEventsDirectlyForCourseTimetable < BaseMutation
        argument :course_id, ID, required: true
        argument :course_section_id, ID, required: false
        argument :events, [String], required: false
        argument :events_start_at, [LMSGraphQL::Types::DateTimeType], required: false
        argument :events_end_at, [LMSGraphQL::Types::DateTimeType], required: false
        argument :events_location_name, String, required: false
        argument :events_code, String, required: false
        argument :events_title, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, course_section_id: nil, events: nil, events_start_at: nil, events_end_at: nil, events_location_name: nil, events_code: nil, events_title: nil)
          context[:canvas_api].call("CREATE_OR_UPDATE_EVENTS_DIRECTLY_FOR_COURSE_TIMETABLE").proxy(
            "CREATE_OR_UPDATE_EVENTS_DIRECTLY_FOR_COURSE_TIMETABLE",
            {
              "course_id": course_id
            },
            {
              "course_section_id": course_section_id,
              "events": events,
              "events[start_at]": events_start_at,
              "events[end_at]": events_end_at,
              "events[location_name]": events_location_name,
              "events[code]": events_code,
              "events[title]": events_title
            },
          ).parsed_response
        end
      end
    end
  end
end