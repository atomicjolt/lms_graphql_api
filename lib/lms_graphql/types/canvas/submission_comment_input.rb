require_relative "../canvas_base_input_type"
require_relative "media_comment"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasSubmissionCommentInput < BaseInputObject
          description "Submissions. API Docs: https://canvas.instructure.com/doc/api/submissions.html"
        argument :id, ID, "Example: 37", required: false
        argument :author_id, ID, "Example: 134", required: false
        argument :author_name, String, "Example: Toph Beifong", required: false
        argument :author, String, "Abbreviated user object UserDisplay (see users API)..Example: {}", required: false
        argument :comment, String, "Example: Well here's the thing.", required: false
        argument :created_at, GraphQL::Types::ISO8601DateTime, "Example: 2012-01-01T01:00:00Z", required: false
        argument :edited_at, GraphQL::Types::ISO8601DateTime, "Example: 2012-01-02T01:00:00Z", required: false
        argument :media_comment, LMSGraphQL::Types::Canvas::CanvasMediaCommentInput, "", required: false

      end
    end
  end
end