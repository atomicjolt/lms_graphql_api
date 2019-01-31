require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetQuotaInformationGroup < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        def resolve(group_id:, get_all: false)
          result = context[:canvas_api].call("GET_QUOTA_INFORMATION_GROUPS").proxy(
            "GET_QUOTA_INFORMATION_GROUPS",
            {
              "group_id": group_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end