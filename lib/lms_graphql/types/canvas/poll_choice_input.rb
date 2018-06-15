require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasPollChoiceInput < BaseInputObject
        description "PollChoices. API Docs: https://canvas.instructure.com/doc/api/poll_choices.html"
        argument :id, ID, "The unique identifier for the poll choice..Example: 1023", required: false
        argument :poll_id, ID, "The id of the poll this poll choice belongs to..Example: 1779", required: false
        argument :is_correct, Boolean, "Specifies whether or not this poll choice is a 'correct' choice..Example: true", required: false
        argument :text, String, "The text of the poll choice..Example: Choice A", required: false
        argument :position, Int, "The order of the poll choice in relation to it's sibling poll choices..Example: 1", required: false

      end
    end
  end
end