require_relative "../canvas_base_input_type"
require_relative "answer"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizQuestionInput < BaseInputObject
        description "Quiz Questions. API Docs: https://canvas.instructure.com/doc/api/quiz_questions.html"
      	argument :id, ID, "The ID of the quiz question..Example: 1", required: false
      	argument :quiz_id, ID, "The ID of the Quiz the question belongs to..Example: 2", required: false
      	argument :position, Int, "The order in which the question will be retrieved and displayed..Example: 1", required: false
      	argument :question_name, String, "The name of the question..Example: Prime Number Identification", required: false
      	argument :question_type, String, "The type of the question..Example: multiple_choice_question", required: false
      	argument :question_text, String, "The text of the question..Example: Which of the following is NOT a prime number?", required: false
      	argument :points_possible, Int, "The maximum amount of points possible received for getting this question correct..Example: 5", required: false
      	argument :correct_comments, String, "The comments to display if the student answers the question correctly..Example: That's correct!", required: false
      	argument :incorrect_comments, String, "The comments to display if the student answers incorrectly..Example: Unfortunately, that IS a prime number.", required: false
      	argument :neutral_comments, String, "The comments to display regardless of how the student answered..Example: Goldbach's conjecture proposes that every even integer greater than 2 can be expressed as the sum of two prime numbers.", required: false
      	argument :answers, [LMSGraphQL::Types::Canvas::CanvasAnswerInput], "An array of available answers to display to the student..", required: false

      end
    end
  end
end