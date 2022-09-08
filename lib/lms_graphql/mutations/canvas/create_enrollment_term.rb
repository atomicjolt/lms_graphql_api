require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment_term"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateEnrollmentTerm < BaseMutation
        argument :account_id, ID, required: true
        argument :enrollment_term_name, String, required: false
        argument :enrollment_term_start_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :enrollment_term_end_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :enrollment_term_sis_term_id, String, required: false
        argument :enrollment_term_overrides_enrollment_type_start_at, GraphQL::Types::ISO8601DateTime, required: false
        argument :enrollment_term_overrides_enrollment_type_end_at, GraphQL::Types::ISO8601DateTime, required: false
        
        
        field :enrollment_term, LMSGraphQL::Types::Canvas::CanvasEnrollmentTerm, null: false
        
        def resolve(account_id:, enrollment_term_name: nil, enrollment_term_start_at: nil, enrollment_term_end_at: nil, enrollment_term_sis_term_id: nil, enrollment_term_overrides_enrollment_type_start_at: nil, enrollment_term_overrides_enrollment_type_end_at: nil)
          context[:canvas_api].call("CREATE_ENROLLMENT_TERM").proxy(
            "CREATE_ENROLLMENT_TERM",
            {
              "account_id": account_id
            },
            {
              "enrollment_term[name]": enrollment_term_name,
              "enrollment_term[start_at]": enrollment_term_start_at,
              "enrollment_term[end_at]": enrollment_term_end_at,
              "enrollment_term[sis_term_id]": enrollment_term_sis_term_id,
              "enrollment_term[overrides][enrollment_type][start_at]": enrollment_term_overrides_enrollment_type_start_at,
              "enrollment_term[overrides][enrollment_type][end_at]": enrollment_term_overrides_enrollment_type_end_at
            },
          ).parsed_response
        end
      end
    end
  end
end