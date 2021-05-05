require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricAssociation < BaseType
          description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
        field :id, ID, "the ID of the association.Example: 1", null: true
        field :rubric_id, ID, "the ID of the rubric.Example: 1", null: true
        field :association_id, ID, "the ID of the object this association links to.Example: 1", null: true
        field :association_type, String, "the type of object this association links to.Example: Course", null: true
        field :use_for_grading, Boolean, "Whether or not the associated rubric is used for grade calculation.Example: true", null: true
        field :summary_data, String, "", null: true
        field :purpose, String, "Whether or not the association is for grading (and thus linked to an assignment) or if it's to indicate the rubric should appear in its context. Values will be grading or bookmark..Example: grading", null: true
        field :hide_score_total, Boolean, "Whether or not the score total is displayed within the rubric. This option is only available if the rubric is not used for grading..Example: true", null: true
        field :hide_points, Boolean, "Example: true", null: true
        field :hide_outcome_results, Boolean, "Example: true", null: true

      end
    end
  end
end