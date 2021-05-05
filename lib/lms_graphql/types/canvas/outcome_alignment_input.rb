require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeAlignmentInput < BaseInputObject
          description "Outcomes. API Docs: https://canvas.instructure.com/doc/api/outcomes.html"
      argument :id, ID, "the id of the aligned learning outcome..Example: 1", required: false
      argument :assignment_id, ID, "the id of the aligned assignment (null for live assessments)..Example: 2", required: false
      argument :assessment_id, ID, "the id of the aligned live assessment (null for assignments)..Example: 3", required: false
      argument :submission_types, String, "a string representing the different submission types of an aligned assignment..Example: online_text_entry,online_url", required: false
      argument :url, String, "the URL for the aligned assignment..Example: /courses/1/assignments/5", required: false
      argument :title, String, "the title of the aligned assignment..Example: Unit 1 test", required: false

      end
    end
  end
end