require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizSubmissionEventInput < BaseInputObject
          description "Quiz Submission Events. API Docs: https://canvas.instructure.com/doc/api/quiz_submission_events.html"
        argument :created_at, GraphQL::Types::ISO8601DateTime, "a timestamp record of creation time.Example: 2014-10-08T19:29:58Z", required: false
        argument :event_type, String, "the type of event being sent.Example: question_answered", required: false
        argument :event_data, String, "custom contextual data for the specific event type.Example: 42", required: false

      end
    end
  end
end