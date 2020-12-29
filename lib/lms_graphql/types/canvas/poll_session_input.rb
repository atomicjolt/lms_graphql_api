require_relative "../canvas_base_input_type"
require_relative "poll_submission"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasPollSessionInput < BaseInputObject
        description "Poll Sessions. API Docs: https://canvas.instructure.com/doc/api/poll_sessions.html"
      argument :id, ID, "The unique identifier for the poll session..Example: 1023", required: false
      argument :poll_id, ID, "The id of the Poll this poll session is associated with.Example: 55", required: false
      argument :course_id, ID, "The id of the Course this poll session is associated with.Example: 1111", required: false
      argument :course_section_id, ID, "The id of the Course Section this poll session is associated with.Example: 444", required: false
      argument :is_published, Boolean, "Specifies whether or not this poll session has been published for students to participate in..Example: true", required: false
      argument :has_public_results, Boolean, "Specifies whether the results are viewable by students..Example: true", required: false
      argument :created_at, String, "The time at which the poll session was created..Example: 2014-01-07T15:16:18Z", required: false
      argument :results, String, "The results of the submissions of the poll. Each key is the poll choice id, and the value is the count of submissions..Example: 10, 3, 27, 8", required: false
      argument :poll_submissions, LMSGraphQL::Types::Canvas::CanvasPollSubmissionInput, "If the poll session has public results, this will return an array of all submissions, viewable by both students and teachers. If the results are not public, for students it will return their submission only..", required: false

      end
    end
  end
end