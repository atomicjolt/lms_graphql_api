require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Mutations
    module Canvas
      class GradeOrCommentOnMultipleSubmissionsCoursesAssignment < BaseMutation
        argument :course_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :grade_data__student_id__posted_grade, String, required: false
        argument :grade_data__student_id__excuse, Boolean, required: false
        argument :grade_data__student_id__rubric_assessment, String, required: false
        argument :grade_data__student_id__text_comment, String, required: false
        argument :grade_data__student_id__group_comment, Boolean, required: false
        argument :grade_data__student_id__media_comment_id, String, required: false
        argument :grade_data__student_id__media_comment_type, String, required: false
        argument :grade_data__student_id__file_ids, [Int], required: false
        argument :grade_data__assignment_id___student_id_, Int, required: false
        
        
        field :progress, LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        
        def resolve(course_id:, assignment_id:, grade_data__student_id__posted_grade: nil, grade_data__student_id__excuse: nil, grade_data__student_id__rubric_assessment: nil, grade_data__student_id__text_comment: nil, grade_data__student_id__group_comment: nil, grade_data__student_id__media_comment_id: nil, grade_data__student_id__media_comment_type: nil, grade_data__student_id__file_ids: nil, grade_data__assignment_id___student_id_: nil)
          context[:canvas_api].call("GRADE_OR_COMMENT_ON_MULTIPLE_SUBMISSIONS_COURSES_ASSIGNMENTS").proxy(
            "GRADE_OR_COMMENT_ON_MULTIPLE_SUBMISSIONS_COURSES_ASSIGNMENTS",
            {
              "course_id": course_id,
              "assignment_id": assignment_id
            },
            {
              "grade_data[<student_id>][posted_grade]": grade_data__student_id__posted_grade,
              "grade_data[<student_id>][excuse]": grade_data__student_id__excuse,
              "grade_data[<student_id>][rubric_assessment]": grade_data__student_id__rubric_assessment,
              "grade_data[<student_id>][text_comment]": grade_data__student_id__text_comment,
              "grade_data[<student_id>][group_comment]": grade_data__student_id__group_comment,
              "grade_data[<student_id>][media_comment_id]": grade_data__student_id__media_comment_id,
              "grade_data[<student_id>][media_comment_type]": grade_data__student_id__media_comment_type,
              "grade_data[<student_id>][file_ids]": grade_data__student_id__file_ids,
              "grade_data[<assignment_id>][<student_id>]": grade_data__assignment_id___student_id_
            },
          ).parsed_response
        end
      end
    end
  end
end