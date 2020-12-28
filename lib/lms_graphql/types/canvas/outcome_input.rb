require_relative "../canvas_base_input_type"
require_relative "rubric_rating"

module LMSGraphQL
  module Types
    module Canvas
        class OutcomeCalculationMethodEnum < ::GraphQL::Schema::Enum
          value "decaying_average"
          value "n_mastery"
          value "latest"
          value "highest"
        end
      class CanvasOutcomeInput < BaseInputObject
        description "Outcomes. API Docs: https://canvas.instructure.com/doc/api/outcomes.html"
      argument :id, ID, "the ID of the outcome.Example: 1", required: false
      argument :url, String, "the URL for fetching/updating the outcome. should be treated as opaque.Example: /api/v1/outcomes/1", required: false
      argument :context_id, ID, "the context owning the outcome. may be null for global outcomes.Example: 1", required: false
      argument :context_type, String, "Example: Account", required: false
      argument :title, String, "title of the outcome.Example: Outcome title", required: false
      argument :display_name, String, "Optional friendly name for reporting.Example: My Favorite Outcome", required: false
      argument :description, String, "description of the outcome. omitted in the abbreviated form..Example: Outcome description", required: false
      argument :vendor_guid, String, "A custom GUID for the learning standard..Example: customid9000", required: false
      argument :points_possible, Int, "maximum points possible. included only if the outcome embeds a rubric criterion. omitted in the abbreviated form..Example: 5", required: false
      argument :mastery_points, Int, "points necessary to demonstrate mastery outcomes. included only if the outcome embeds a rubric criterion. omitted in the abbreviated form..Example: 3", required: false
      argument :calculation_method, OutcomeCalculationMethodEnum, "the method used to calculate a students score.Example: decaying_average", required: false
      argument :calculation_int, Int, "this defines the variable value used by the calculation_method. included only if calculation_method uses it.Example: 65", required: false
      argument :ratings, [LMSGraphQL::Types::Canvas::CanvasRubricRatingInput], "possible ratings for this outcome. included only if the outcome embeds a rubric criterion. omitted in the abbreviated form..", required: false
      argument :can_edit, Boolean, "whether the current user can update the outcome.Example: true", required: false
      argument :can_unlink, Boolean, "whether the outcome can be unlinked.Example: true", required: false
      argument :assessed, Boolean, "whether this outcome has been used to assess a student.Example: true", required: false
      argument :has_updateable_rubrics, Boolean, "whether updates to this outcome will propagate to unassessed rubrics that have imported it.Example: true", required: false

      end
    end
  end
end