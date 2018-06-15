require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasQuizSubmissionEvent < BaseType
        description "Quiz Submission Events. API Docs: https://canvas.instructure.com/doc/api/quiz_submission_events.html"
        field :created_at, LMSGraphQL::Types::DateTimeType, "a timestamp record of creation time.Example: 2014-10-08T19:29:58Z", null: true
        field :event_type, String, "the type of event being sent.Example: question_answered", null: true
        field :event_data, String, "custom contextual data for the specific event type.Example: 42", null: true

      end
    end
  end
end