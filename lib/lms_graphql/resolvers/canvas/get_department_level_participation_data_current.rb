require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetDepartmentLevelParticipationDataCurrent < CanvasBaseResolver
        type Boolean, null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("GET_DEPARTMENT_LEVEL_PARTICIPATION_DATA_CURRENT").proxy(
            "GET_DEPARTMENT_LEVEL_PARTICIPATION_DATA_CURRENT",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end