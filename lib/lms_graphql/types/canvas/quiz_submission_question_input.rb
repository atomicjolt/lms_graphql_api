require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizSubmissionQuestionInput < BaseInputObject
          description "Quiz Submission Questions. API Docs: https://canvas.instructure.com/doc/api/quiz_submission_questions.html"
      argument :id, ID, "The ID of the QuizQuestion this answer is for..Example: 1", required: false
      argument :flagged, Boolean, "Whether this question is flagged..Example: true", required: false
      argument :answer, String, "The provided answer (if any) for this question. The format of this parameter depends on the type of the question, see the Appendix for more information..", required: false
      argument :answers, String, "The possible answers for this question when those possible answers are necessary.  The presence of this parameter is dependent on permissions..", required: false

      end
    end
  end
end