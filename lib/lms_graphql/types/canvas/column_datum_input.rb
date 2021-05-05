require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasColumnDatumInput < BaseInputObject
          description "Custom Gradebook Columns. API Docs: https://canvas.instructure.com/doc/api/custom_gradebook_columns.html"
      argument :content, String, "Example: Nut allergy", required: false
      argument :user_id, ID, "Example: 2", required: false

      end
    end
  end
end