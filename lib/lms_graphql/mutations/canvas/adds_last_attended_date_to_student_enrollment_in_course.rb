require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment"
module LMSGraphQL
  module Mutations
    module Canvas
      class AddsLastAttendedDateToStudentEnrollmentInCourse < BaseMutation
        argument :course_id, ID, required: true
        argument :user_id, ID, required: true
        field :enrollment, LMSGraphQL::Types::Canvas::CanvasEnrollment, null: false
        def resolve(course_id:, user_id:)
          context[:canvas_api].call("ADDS_LAST_ATTENDED_DATE_TO_STUDENT_ENROLLMENT_IN_COURSE").proxy(
            "ADDS_LAST_ATTENDED_DATE_TO_STUDENT_ENROLLMENT_IN_COURSE",
            {
              "course_id": course_id,
              "user_id": user_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end