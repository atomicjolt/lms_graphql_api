require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCustomColumnInput < BaseInputObject
          description "Custom Gradebook Columns. API Docs: https://canvas.instructure.com/doc/api/custom_gradebook_columns.html"
        argument :id, ID, "The ID of the custom gradebook column.Example: 2", required: false
        argument :teacher_notes, Boolean, "When true, this column's visibility will be toggled in the Gradebook when a user selects to show or hide notes.", required: false
        argument :title, String, "header text.Example: Stuff", required: false
        argument :position, Int, "column order.Example: 1", required: false
        argument :hidden, Boolean, "won't be displayed if hidden is true.", required: false
        argument :read_only, Boolean, "won't be editable in the gradebook UI.Example: true", required: false

      end
    end
  end
end