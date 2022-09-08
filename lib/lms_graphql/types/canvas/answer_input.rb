require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAnswerInput < BaseInputObject
          description "Quiz Questions. API Docs: https://canvas.instructure.com/doc/api/quiz_questions.html"
        argument :id, ID, "The unique identifier for the answer.  Do not supply if this answer is part of a new question.Example: 6656", required: false
        argument :answer_text, String, "The text of the answer..Example: Constantinople", required: false
        argument :answer_weight, Int, "An integer to determine correctness of the answer. Incorrect answers should be 0, correct answers should be 100..Example: 100", required: false
        argument :answer_comments, String, "Specific contextual comments for a particular answer..Example: Remember to check your spelling prior to submitting this answer.", required: false
        argument :text_after_answers, String, "Used in missing word questions.  The text to follow the missing word.Example:  is the capital of Utah.", required: false
        argument :answer_match_left, String, "Used in matching questions.  The static value of the answer that will be displayed on the left for students to match for..Example: Salt Lake City", required: false
        argument :answer_match_right, String, "Used in matching questions. The correct match for the value given in answer_match_left.  Will be displayed in a dropdown with the other answer_match_right values...Example: Utah", required: false
        argument :matching_answer_incorrect_matches, String, "Used in matching questions. A list of distractors, delimited by new lines (
) that will be seeded with all the answer_match_right values..Example: Nevada California Washington", required: false
        argument :numerical_answer_type, String, "Used in numerical questions.  Values can be 'exact_answer', 'range_answer', or 'precision_answer'..Example: exact_answer", required: false
        argument :exact, Int, "Used in numerical questions of type 'exact_answer'.  The value the answer should equal..Example: 42", required: false
        argument :margin, Int, "Used in numerical questions of type 'exact_answer'. The margin of error allowed for the student's answer..Example: 4", required: false
        argument :approximate, Float, "Used in numerical questions of type 'precision_answer'.  The value the answer should equal..Example: 1234600000.0", required: false
        argument :precision, Int, "Used in numerical questions of type 'precision_answer'. The numerical precision that will be used when comparing the student's answer..Example: 4", required: false
        argument :start, Int, "Used in numerical questions of type 'range_answer'. The start of the allowed range (inclusive)..Example: 1", required: false
        argument :end, Int, "Used in numerical questions of type 'range_answer'. The end of the allowed range (inclusive)..Example: 10", required: false
        argument :blank_id, ID, "Used in fill in multiple blank and multiple dropdowns questions..Example: 1170", required: false

      end
    end
  end
end