require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetDepartmentLevelGradeDataCompleted < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:, get_all: false)
          result = context[:canvas_api].call("GET_DEPARTMENT_LEVEL_GRADE_DATA_COMPLETED").proxy(
            "GET_DEPARTMENT_LEVEL_GRADE_DATA_COMPLETED",
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