require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricRating < BaseType
        description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
      	field :id, ID, "Example: name_2", null: true
      	field :criterion_id, ID, "Example: _10", null: true
      	field :description, String, "", null: true
      	field :long_description, String, "", null: true
      	field :points, Int, "Example: 5", null: true

      end
    end
  end
end