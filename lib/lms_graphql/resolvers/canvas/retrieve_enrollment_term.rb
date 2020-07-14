require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/enrollment_term"
module LMSGraphQL
  module Resolvers
    module Canvas
      class RetrieveEnrollmentTerm < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasEnrollmentTerm, null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        def resolve(account_id:, id:, get_all: false)
          result = context[:canvas_api].call("RETRIEVE_ENROLLMENT_TERM").proxy(
            "RETRIEVE_ENROLLMENT_TERM",
            {
              "account_id": account_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end