require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment"
module LMSGraphQL
  module Mutations
    module Canvas
      class EnrollUserCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :enrollment_start_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :enrollment_end_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :enrollment_user_id, String, required: true
        argument :enrollment_type, String, required: true
        argument :enrollment_role, String, required: false
        argument :enrollment_role_id, Int, required: false
        argument :enrollment_enrollment_state, String, required: false
        argument :enrollment_course_section_id, Int, required: false
        argument :enrollment_limit_privileges_to_course_section, Boolean, required: false
        argument :enrollment_notify, Boolean, required: false
        argument :enrollment_self_enrollment_code, String, required: false
        argument :enrollment_self_enrolled, Boolean, required: false
        argument :enrollment_associated_user_id, Int, required: false
        
        
        field :enrollment, LMSGraphQL::Types::Canvas::CanvasEnrollment, null: false
        
        def resolve(course_id:, enrollment_start_at: nil, enrollment_end_at: nil, enrollment_user_id:, enrollment_type:, enrollment_role: nil, enrollment_role_id: nil, enrollment_enrollment_state: nil, enrollment_course_section_id: nil, enrollment_limit_privileges_to_course_section: nil, enrollment_notify: nil, enrollment_self_enrollment_code: nil, enrollment_self_enrolled: nil, enrollment_associated_user_id: nil)
          context[:canvas_api].call("ENROLL_USER_COURSES").proxy(
            "ENROLL_USER_COURSES",
            {
              "course_id": course_id
            },
            {
              "enrollment[start_at]": enrollment_start_at,
              "enrollment[end_at]": enrollment_end_at,
              "enrollment[user_id]": enrollment_user_id,
              "enrollment[type]": enrollment_type,
              "enrollment[role]": enrollment_role,
              "enrollment[role_id]": enrollment_role_id,
              "enrollment[enrollment_state]": enrollment_enrollment_state,
              "enrollment[course_section_id]": enrollment_course_section_id,
              "enrollment[limit_privileges_to_course_section]": enrollment_limit_privileges_to_course_section,
              "enrollment[notify]": enrollment_notify,
              "enrollment[self_enrollment_code]": enrollment_self_enrollment_code,
              "enrollment[self_enrolled]": enrollment_self_enrolled,
              "enrollment[associated_user_id]": enrollment_associated_user_id
            },
          ).parsed_response
        end
      end
    end
  end
end