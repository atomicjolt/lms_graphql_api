require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCompletionRequirement < BaseType
          class CompletionRequirementTypeEnum < ::GraphQL::Schema::Enum
          value "must_view"
          value "must_submit"
          value "must_contribute"
          value "min_score"
          value "must_mark_done"
        end
        description "Modules. API Docs: https://canvas.instructure.com/doc/api/modules.html"
        field :type, CompletionRequirementTypeEnum, "one of 'must_view', 'must_submit', 'must_contribute', 'min_score', 'must_mark_done'.Example: min_score", null: true
        field :min_score, Int, "minimum score required to complete (only present when type == 'min_score').Example: 10", null: true
        field :completed, Boolean, "whether the calling user has met this requirement (Optional; present only if the caller is a student or if the optional parameter 'student_id' is included).Example: true", null: true

      end
    end
  end
end