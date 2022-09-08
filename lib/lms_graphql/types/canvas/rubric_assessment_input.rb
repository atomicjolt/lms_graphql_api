require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasRubricAssessmentInput < BaseInputObject
          description "Rubrics. API Docs: https://canvas.instructure.com/doc/api/rubrics.html"
        argument :id, ID, "the ID of the rubric.Example: 1", required: false
        argument :rubric_id, ID, "the rubric the assessment belongs to.Example: 1", required: false
        argument :rubric_association_id, ID, "Example: 2", required: false
        argument :score, Int, "Example: 5.0", required: false
        argument :artifact_type, String, "the object of the assessment.Example: Submission", required: false
        argument :artifact_id, ID, "the id of the object of the assessment.Example: 3", required: false
        argument :artifact_attempt, Int, "the current number of attempts made on the object of the assessment.Example: 2", required: false
        argument :assessment_type, String, "the type of assessment. values will be either 'grading', 'peer_review', or 'provisional_grade'.Example: grading", required: false
        argument :assessor_id, ID, "user id of the person who made the assessment.Example: 6", required: false
        argument :data, [String], "(Optional) If 'full' is included in the 'style' parameter, returned assessments will have their full details contained in their data hash. If the user does not request a style, this key will be absent..", required: false
        argument :comments, [String], "(Optional) If 'comments_only' is included in the 'style' parameter, returned assessments will include only the comments portion of their data hash. If the user does not request a style, this key will be absent..", required: false

      end
    end
  end
end