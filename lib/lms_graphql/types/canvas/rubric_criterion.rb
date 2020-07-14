require_relative "../canvas_base_type"
require_relative "rubric_rating"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricCriterion < BaseType
        description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
        field :id, ID, "the ID of the criterion.Example: _10", null: true
        field :description, String, "", null: true
        field :long_description, String, "", null: true
        field :points, Int, "Example: 5", null: true
        field :criterion_use_range, Boolean, "Example: false", null: true
        field :ratings, [LMSGraphQL::Types::Canvas::CanvasRubricRating], "the possible ratings for this Criterion.", null: true

      end
    end
  end
end