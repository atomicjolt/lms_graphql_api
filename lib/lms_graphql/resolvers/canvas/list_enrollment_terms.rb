require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/enrollment_term"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListEnrollmentTerm < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasEnrollmentTerm], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :workflow_state, String, required: false
        argument :include, String, required: false
        def resolve(account_id:, workflow_state: nil, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_ENROLLMENT_TERMS").proxy(
            "LIST_ENROLLMENT_TERMS",
            {
              "account_id": account_id,
              "workflow_state": workflow_state,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end