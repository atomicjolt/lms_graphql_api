require_relative "../canvas_base_input_type"
require_relative "epub_export"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasCourseEpubExportInput < BaseInputObject
        description "ePub Exports. API Docs: https://canvas.instructure.com/doc/api/e_pub_exports.html"
      argument :id, ID, "the unique identifier for the course.Example: 101", required: false
      argument :name, String, "the name for the course.Example: Maths 101", required: false
      argument :epub_export, LMSGraphQL::Types::Canvas::CanvasEpubExportInput, "ePub export API object.", required: false

      end
    end
  end
end