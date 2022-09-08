require_relative "../canvas_base_input_type"
require_relative "rubric_rating"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricCriterionInput < BaseInputObject
          description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
        argument :id, ID, "the ID of the criterion.Example: _10", required: false
        argument :description, String, "", required: false
        argument :long_description, String, "", required: false
        argument :points, Int, "Example: 5", required: false
        argument :criterion_use_range, Boolean, "Example: false", required: false
        argument :ratings, [LMSGraphQL::Types::Canvas::CanvasRubricRatingInput], "the possible ratings for this Criterion.", required: false

      end
    end
  end
end