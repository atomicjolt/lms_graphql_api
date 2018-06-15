require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasSisImportErrorInput < BaseInputObject
        description "SIS Import Errors. API Docs: https://canvas.instructure.com/doc/api/sis_import_errors.html"
        argument :sis_import_id, ID, "The unique identifier for the SIS import..Example: 1", required: false
        argument :file, String, "The file where the error message occurred..Example: courses.csv", required: false
        argument :message, String, "The error message that from the record..Example: No short_name given for course C001", required: false
        argument :row, Int, "The line number where the error occurred. Some Importers do not yet support this. This is a 1 based index starting with the header row..Example: 34", required: false

      end
    end
  end
end