require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeAlignment < BaseType
        description "Outcomes. API Docs: https://canvas.instructure.com/doc/api/outcomes.html"
      	field :id, ID, "the id of the aligned learning outcome..Example: 1", null: true
      	field :assignment_id, ID, "the id of the aligned assignment (null for live assessments)..Example: 2", null: true
      	field :assessment_id, ID, "the id of the aligned live assessment (null for assignments)..Example: 3", null: true
      	field :submission_types, String, "a string representing the different submission types of an aligned assignment..Example: online_text_entry,online_url", null: true
      	field :url, String, "the URL for the aligned assignment..Example: /courses/1/assignments/5", null: true
      	field :title, String, "the title of the aligned assignment..Example: Unit 1 test", null: true

      end
    end
  end
end