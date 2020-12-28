require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasPollInput < BaseInputObject
        description "Polls. API Docs: https://canvas.instructure.com/doc/api/polls.html"
      argument :id, ID, "The unique identifier for the poll..Example: 1023", required: false
      argument :question, String, "The question/title of the poll..Example: What do you consider most important to your learning in this course?", required: false
      argument :description, String, "A short description of the poll..Example: This poll is to determine what priorities the students in the course have.", required: false
      argument :created_at, String, "The time at which the poll was created..Example: 2014-01-07T15:16:18Z", required: false
      argument :user_id, ID, "The unique identifier for the user that created the poll..Example: 105", required: false
      argument :total_results, String, "An aggregate of the results of all associated poll sessions, with the poll choice id as the key, and the aggregated submission count as the value..Example: 20, 5, 17", required: false

      end
    end
  end
end