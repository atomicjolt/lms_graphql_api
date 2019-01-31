require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetDepartmentLevelGradeDataTerm < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        argument :term_id, ID, required: true
        def resolve(account_id:, term_id:, get_all: false)
          result = context[:canvas_api].call("GET_DEPARTMENT_LEVEL_GRADE_DATA_TERMS").proxy(
            "GET_DEPARTMENT_LEVEL_GRADE_DATA_TERMS",
            {
              "account_id": account_id,
              "term_id": term_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end