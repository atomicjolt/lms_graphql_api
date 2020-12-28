require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasMediaCommentInput < BaseInputObject
        description "Submissions. API Docs: https://canvas.instructure.com/doc/api/submissions.html"
      argument :content_type, String, "Example: audio/mp4", required: false
      argument :display_name, String, "Example: something", required: false
      argument :media_id, ID, "Example: 3232", required: false
      argument :media_type, String, "Example: audio", required: false
      argument :url, String, "Example: http://example.com/media_url", required: false

      end
    end
  end
end