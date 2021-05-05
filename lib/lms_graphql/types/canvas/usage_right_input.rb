require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasUsageRightInput < BaseInputObject
          description "Files. API Docs: https://canvas.instructure.com/doc/api/files.html"
      argument :legal_copyright, String, "Copyright line for the file.Example: (C) 2014 Incom Corporation Ltd", required: false
      argument :use_justification, String, "Justification for using the file in a Canvas course. Valid values are 'own_copyright', 'public_domain', 'used_by_permission', 'fair_use', 'creative_commons'.Example: creative_commons", required: false
      argument :license, String, "License identifier for the file..Example: cc_by_sa", required: false
      argument :license_name, String, "Readable license name.Example: CC Attribution Share-Alike", required: false
      argument :message, String, "Explanation of the action performed.Example: 4 files updated", required: false
      argument :file_ids, [ID], "List of ids of files that were updated.Example: 1, 2, 3", required: false

      end
    end
  end
end