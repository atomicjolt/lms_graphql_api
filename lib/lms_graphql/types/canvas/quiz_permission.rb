require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizPermission < BaseType
        description "Quizzes. API Docs: https://canvas.instructure.com/doc/api/quizzes.html"
      	field :read, Boolean, "whether the user can view the quiz.Example: true", null: true
      	field :submit, Boolean, "whether the user may submit a submission for the quiz.Example: true", null: true
      	field :create, Boolean, "whether the user may create a new quiz.Example: true", null: true
      	field :manage, Boolean, "whether the user may edit, update, or delete the quiz.Example: true", null: true
      	field :read_statistics, Boolean, "whether the user may view quiz statistics for this quiz.Example: true", null: true
      	field :review_grades, Boolean, "whether the user may review grades for all quiz submissions for this quiz.Example: true", null: true
      	field :update, Boolean, "whether the user may update the quiz.Example: true", null: true

      end
    end
  end
end