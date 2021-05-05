require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasMigratorInput < BaseInputObject
          description "Content Migrations. API Docs: https://canvas.instructure.com/doc/api/content_migrations.html"
      argument :type, String, "The value to pass to the create endpoint.Example: common_cartridge_importer", required: false
      argument :requires_file_upload, Boolean, "Whether this endpoint requires a file upload.Example: true", required: false
      argument :name, String, "Description of the package type expected.Example: Common Cartridge 1.0/1.1/1.2 Package", required: false
      argument :required_settings, String, "A list of fields this system requires.Example: source_course_id", required: false

      end
    end
  end
end