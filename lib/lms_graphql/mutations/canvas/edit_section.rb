require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Mutations
    module Canvas
      class EditSection < BaseMutation
        argument :id, ID, required: true
        argument :course_section_name, String, required: false
        argument :course_section_sis_section_id, String, required: false
        argument :course_section_integration_id, String, required: false
        argument :course_section_start_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :course_section_end_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :course_section_restrict_enrollments_to_section_dates, Boolean, required: false
        argument :override_sis_stickiness, Boolean, required: false
        
        
        field :section, LMSGraphQL::Types::Canvas::CanvasSection, null: false
        
        def resolve(id:, course_section_name: nil, course_section_sis_section_id: nil, course_section_integration_id: nil, course_section_start_at: nil, course_section_end_at: nil, course_section_restrict_enrollments_to_section_dates: nil, override_sis_stickiness: nil)
          context[:canvas_api].call("EDIT_SECTION").proxy(
            "EDIT_SECTION",
            {
              "id": id
            },
            {
              "course_section[name]": course_section_name,
              "course_section[sis_section_id]": course_section_sis_section_id,
              "course_section[integration_id]": course_section_integration_id,
              "course_section[start_at]": course_section_start_at,
              "course_section[end_at]": course_section_end_at,
              "course_section[restrict_enrollments_to_section_dates]": course_section_restrict_enrollments_to_section_dates,
              "override_sis_stickiness": override_sis_stickiness
            },
          ).parsed_response
        end
      end
    end
  end
end