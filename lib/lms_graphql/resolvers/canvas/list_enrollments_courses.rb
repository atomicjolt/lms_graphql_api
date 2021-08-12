require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/enrollment"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListEnrollmentsCourse < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasEnrollment], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :type, [String], required: false
        argument :role, [String], required: false
        argument :state, [String], required: false
        argument :include, [String], required: false
        argument :user_id, ID, required: false
        argument :grading_period_id, ID, required: false
        argument :enrollment_term_id, ID, required: false
        argument :sis_account_id, [ID], required: false
        argument :sis_course_id, [ID], required: false
        argument :sis_section_id, [ID], required: false
        argument :sis_user_id, [ID], required: false
        argument :created_for_sis_id, [ID], required: false
        def resolve(course_id:, type: nil, role: nil, state: nil, include: nil, user_id: nil, grading_period_id: nil, enrollment_term_id: nil, sis_account_id: nil, sis_course_id: nil, sis_section_id: nil, sis_user_id: nil, created_for_sis_id: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ENROLLMENTS_COURSES").proxy(
            "LIST_ENROLLMENTS_COURSES",
            {
              "course_id": course_id,
              "type": type,
              "role": role,
              "state": state,
              "include": include,
              "user_id": user_id,
              "grading_period_id": grading_period_id,
              "enrollment_term_id": enrollment_term_id,
              "sis_account_id": sis_account_id,
              "sis_course_id": sis_course_id,
              "sis_section_id": sis_section_id,
              "sis_user_id": sis_user_id,
              "created_for_sis_id": created_for_sis_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end