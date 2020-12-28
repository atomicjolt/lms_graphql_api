require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasOutcomeRollupLinkInput < BaseInputObject
        description "Outcome Results. API Docs: https://canvas.instructure.com/doc/api/outcome_results.html"
      argument :course, Int, "If an aggregate result was requested, the course field will be present. Otherwise, the user and section field will be present (Optional) The id of the course that this rollup applies to.Example: 42", required: false
      argument :user, Int, "(Optional) The id of the user that this rollup applies to.Example: 42", required: false
      argument :section, Int, "(Optional) The id of the section the user is in.Example: 57", required: false

      end
    end
  end
end