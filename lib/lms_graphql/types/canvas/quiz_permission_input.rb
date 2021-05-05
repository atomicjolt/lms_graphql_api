require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizPermissionInput < BaseInputObject
          description "Quizzes. API Docs: https://canvas.instructure.com/doc/api/quizzes.html"
      argument :read, Boolean, "whether the user can view the quiz.Example: true", required: false
      argument :submit, Boolean, "whether the user may submit a submission for the quiz.Example: true", required: false
      argument :create, Boolean, "whether the user may create a new quiz.Example: true", required: false
      argument :manage, Boolean, "whether the user may edit, update, or delete the quiz.Example: true", required: false
      argument :read_statistics, Boolean, "whether the user may view quiz statistics for this quiz.Example: true", required: false
      argument :review_grades, Boolean, "whether the user may review grades for all quiz submissions for this quiz.Example: true", required: false
      argument :update, Boolean, "whether the user may update the quiz.Example: true", required: false

      end
    end
  end
end