require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasFileAttachmentInput < BaseInputObject
        description "Discussion Topics. API Docs: https://canvas.instructure.com/doc/api/discussion_topics.html"
        argument :content_type, String, "Example: unknown/unknown", required: false
        argument :url, String, "Example: http://www.example.com/courses/1/files/1/download", required: false
        argument :filename, String, "Example: content.txt", required: false
        argument :display_name, String, "Example: content.txt", required: false

      end
    end
  end
end