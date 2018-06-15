require_relative "../canvas_base_type"
require_relative "submission_version"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasSubmissionHistory < BaseType
        description "Gradebook History. API Docs: https://canvas.instructure.com/doc/api/gradebook_history.html"
        field :submission_id, ID, "the id of the submission.Example: 4", null: true
        field :versions, [LMSGraphQL::Types::Canvas::CanvasSubmissionVersion], "an array of all the versions of this submission.", null: true

      end
    end
  end
end