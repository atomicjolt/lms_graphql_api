require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleSubmission < CanvasBaseResolver
        type Boolean, null: false
        argument :assignment_id, ID, required: true
        argument :submission_id, ID, required: true
        def resolve(assignment_id:, submission_id:, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_SUBMISSION").proxy(
            "GET_SINGLE_SUBMISSION",
            {
              "assignment_id": assignment_id,
              "submission_id": submission_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end