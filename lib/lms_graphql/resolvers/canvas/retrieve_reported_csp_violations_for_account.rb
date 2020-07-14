require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class RetrieveReportedCspViolationsForAccount < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("RETRIEVE_REPORTED_CSP_VIOLATIONS_FOR_ACCOUNT").proxy(
            "RETRIEVE_REPORTED_CSP_VIOLATIONS_FOR_ACCOUNT",
            {
              "account_id": account_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end