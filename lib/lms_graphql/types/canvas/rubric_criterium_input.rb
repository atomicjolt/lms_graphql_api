require_relative "../canvas_base_input_type"
require_relative "rubric_rating_input"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricCriteriumInput < BaseInputObject
        description "Assignments. API Docs: https://canvas.instructure.com/doc/api/assignments.html"
        argument :points, Int, "Example: 10", required: false
        argument :id, ID, "The id of rubric criteria..Example: crit1", required: false
        argument :learning_outcome_id, ID, "(Optional) The id of the learning outcome this criteria uses, if any..Example: 1234", required: false
        argument :vendor_guid, String, "(Optional) The 3rd party vendor's GUID for the outcome this criteria references, if any..Example: abdsfjasdfne3jsdfn2", required: false
        argument :description, String, "Example: Criterion 1", required: false
        argument :long_description, String, "Example: Criterion 1 more details", required: false
        argument :criterion_use_range, Boolean, "Example: true", required: false
        argument :ratings, [LMSGraphQL::Types::Canvas::CanvasRubricRatingInput], "", required: false

      end
    end
  end
end