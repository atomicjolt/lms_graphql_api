require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricAssociationInput < BaseInputObject
        description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
      	argument :id, ID, "the ID of the association.Example: 1", required: false
      	argument :rubric_id, ID, "the ID of the rubric.Example: 1", required: false
      	argument :association_id, ID, "the ID of the object this association links to.Example: 1", required: false
      	argument :association_type, String, "the type of object this association links to.Example: Course", required: false
      	argument :use_for_grading, Boolean, "Whether or not the associated rubric is used for grade calculation.Example: true", required: false
      	argument :summary_data, String, "", required: false
      	argument :purpose, String, "Whether or not the association is for grading (and thus linked to an assignment) or if it's to indicate the rubric should appear in its context. Values will be grading or bookmark..Example: grading", required: false
      	argument :hide_score_total, Boolean, "Whether or not the score total is displayed within the rubric. This option is only available if the rubric is not used for grading..Example: true", required: false
      	argument :hide_points, Boolean, "Example: true", required: false
      	argument :hide_outcome_results, Boolean, "Example: true", required: false

      end
    end
  end
end