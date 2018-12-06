require_relative "../canvas_base_input_type"
require_relative "submission_version"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasSubmissionHistoryInput < BaseInputObject
        description "Gradebook History. API Docs: https://canvas.instructure.com/doc/api/gradebook_history.html"
        argument :submission_id, ID, "the id of the submission.Example: 4", required: false
        argument :versions, [LMSGraphQL::Types::Canvas::CanvasSubmissionVersionInput], "an array of all the versions of this submission.", required: false

      end
    end
  end
end