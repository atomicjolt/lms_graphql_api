require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
        class CompletionRequirementTypeEnum < ::GraphQL::Schema::Enum
          value "must_view"
          value "must_submit"
          value "must_contribute"
          value "min_score"
          value "must_mark_done"
        end
      class CanvasCompletionRequirementInput < BaseInputObject
        description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
        argument :type, CompletionRequirementTypeEnum, "one of 'must_view', 'must_submit', 'must_contribute', 'min_score'.Example: min_score", required: false
        argument :min_score, Int, "minimum score required to complete (only present when type == 'min_score').Example: 10", required: false
        argument :completed, Boolean, "whether the calling user has met this requirement (Optional; present only if the caller is a student or if the optional parameter 'student_id' is included).Example: true", required: false

      end
    end
  end
end