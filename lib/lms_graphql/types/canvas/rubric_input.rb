require_relative "../canvas_base_input_type"
require_relative "rubric_criterion"
require_relative "rubric_assessment"
require_relative "rubric_association"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricInput < BaseInputObject
        description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
      	argument :id, ID, "the ID of the rubric.Example: 1", required: false
      	argument :title, String, "title of the rubric.Example: some title", required: false
      	argument :context_id, ID, "the context owning the rubric.Example: 1", required: false
      	argument :context_type, String, "Example: Course", required: false
      	argument :points_possible, Int, "Example: 10.0", required: false
      	argument :reusable, Boolean, "Example: false", required: false
      	argument :read_only, Boolean, "Example: true", required: false
      	argument :free_form_criterion_comments, Boolean, "whether or not free-form comments are used.Example: true", required: false
      	argument :hide_score_total, Boolean, "Example: true", required: false
      	argument :data, [LMSGraphQL::Types::Canvas::CanvasRubricCriterionInput], "An array with all of this Rubric's grading Criteria.", required: false
      	argument :assessments, [LMSGraphQL::Types::Canvas::CanvasRubricAssessmentInput], "If an assessment type is included in the 'include' parameter, includes an array of rubric assessment objects for a given rubric, based on the assessment type requested. If the user does not request an assessment type this key will be absent..", required: false
      	argument :associations, [LMSGraphQL::Types::Canvas::CanvasRubricAssociationInput], "If an association type is included in the 'include' parameter, includes an array of rubric association objects for a given rubric, based on the association type requested. If the user does not request an association type this key will be absent..", required: false

      end
    end
  end
end