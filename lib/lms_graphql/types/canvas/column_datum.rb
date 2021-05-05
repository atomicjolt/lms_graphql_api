require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasColumnDatum < BaseType
          description "Custom Gradebook Columns. API Docs: https://canvas.instructure.com/doc/api/custom_gradebook_columns.html"
        field :content, String, "Example: Nut allergy", null: true
        field :user_id, ID, "Example: 2", null: true

      end
    end
  end
end