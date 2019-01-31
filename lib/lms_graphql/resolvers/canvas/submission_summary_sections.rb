require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class SubmissionSummarySection < CanvasBaseResolver
        type Boolean, null: false
        argument :section_id, ID, required: true
        argument :assignment_id, ID, required: true
        argument :grouped, Boolean, required: false
        def resolve(section_id:, assignment_id:, grouped: nil, get_all: false)
          result = context[:canvas_api].call("SUBMISSION_SUMMARY_SECTIONS").proxy(
            "SUBMISSION_SUMMARY_SECTIONS",
            {
              "section_id": section_id,
              "assignment_id": assignment_id,
              "grouped": grouped            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end