require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasFileInput < BaseInputObject
          description "Plagiarism Detection Submissions. API Docs: https://canvas.instructure.com/doc/api/plagiarism_detection_submissions.html"
      argument :size, Int, "Example: 4", required: false
      argument :content_type, String, "Example: text/plain", required: false
      argument :url, String, "Example: http://www.example.com/files/569/download?download_frd=1&verifier=c6HdZmxOZa0Fiin2cbvZeI8I5ry7yqD7RChQzb6P", required: false
      argument :id, ID, "Example: 569", required: false
      argument :display_name, String, "Example: file.txt", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", required: false
      argument :updated_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", required: false

      end
    end
  end
end