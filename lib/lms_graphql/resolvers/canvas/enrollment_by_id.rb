require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/enrollment"
module LMSGraphQL
  module Resolvers
    module Canvas
      class EnrollmentById < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasEnrollment, null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        def resolve(account_id:, id:)
          context[:canvas_api].call("ENROLLMENT_BY_ID").proxy(
            "ENROLLMENT_BY_ID",
            {
              "account_id": account_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end