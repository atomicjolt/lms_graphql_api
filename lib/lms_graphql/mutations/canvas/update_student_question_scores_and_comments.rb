require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateStudentQuestionScoresAndComment < BaseMutation
        argument :course_id, ID, required: true
        argument :quiz_id, ID, required: true
        argument :id, ID, required: true
        argument :quiz_submissions_attempt, [Int], required: true
        argument :quiz_submissions_fudge_points, [Float], required: false
        argument :quiz_submissions_questions, [LMSGraphQL::Types::Canvas::CanvasHashInput], required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(course_id:, quiz_id:, id:, quiz_submissions_attempt:, quiz_submissions_fudge_points: nil, quiz_submissions_questions: nil)
          context[:canvas_api].call("UPDATE_STUDENT_QUESTION_SCORES_AND_COMMENTS").proxy(
            "UPDATE_STUDENT_QUESTION_SCORES_AND_COMMENTS",
            {
              "course_id": course_id,
              "quiz_id": quiz_id,
              "id": id
            },
            {
              "quiz_submissions[attempt]": quiz_submissions_attempt,
              "quiz_submissions[fudge_points]": quiz_submissions_fudge_points,
              "quiz_submissions[questions]": quiz_submissions_questions
            },
          ).parsed_response
        end
      end
    end
  end
end