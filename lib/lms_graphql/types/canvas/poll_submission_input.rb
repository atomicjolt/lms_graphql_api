require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasPollSubmissionInput < BaseInputObject
          description "PollSubmissions. API Docs: https://canvas.instructure.com/doc/api/poll_submissions.html"
      argument :id, ID, "The unique identifier for the poll submission..Example: 1023", required: false
      argument :poll_choice_id, ID, "The unique identifier of the poll choice chosen for this submission..Example: 155", required: false
      argument :user_id, ID, "the unique identifier of the user who submitted this poll submission..Example: 4555", required: false
      argument :created_at, String, "The date and time the poll submission was submitted..Example: 2013-11-07T13:16:18Z", required: false

      end
    end
  end
end