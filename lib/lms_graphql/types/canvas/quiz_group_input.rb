require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizGroupInput < BaseInputObject
          description "Quiz Question Groups. API Docs: https://canvas.instructure.com/doc/api/quiz_question_groups.html"
      argument :id, ID, "The ID of the question group..Example: 1", required: false
      argument :quiz_id, ID, "The ID of the Quiz the question group belongs to..Example: 2", required: false
      argument :name, String, "The name of the question group..Example: Fraction questions", required: false
      argument :pick_count, Int, "The number of questions to pick from the group to display to the student..Example: 3", required: false
      argument :question_points, Int, "The amount of points allotted to each question in the group..Example: 10", required: false
      argument :assessment_question_bank_id, ID, "The ID of the Assessment question bank to pull questions from..Example: 2", required: false
      argument :position, Int, "The order in which the question group will be retrieved and displayed..Example: 1", required: false

      end
    end
  end
end