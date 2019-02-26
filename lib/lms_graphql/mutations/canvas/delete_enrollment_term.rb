require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment_term"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteEnrollmentTerm < BaseMutation
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        field :enrollment_term, LMSGraphQL::Types::Canvas::CanvasEnrollmentTerm, null: false
        def resolve(account_id:, id:)
          context[:canvas_api].call("DELETE_ENROLLMENT_TERM").proxy(
            "DELETE_ENROLLMENT_TERM",
            {
              "account_id": account_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end