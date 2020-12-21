require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ExportGroupsInAndUsersInCategory < CanvasBaseResolver
        type Boolean, null: false
        argument :group_category_id, ID, required: true
        def resolve(group_category_id:, get_all: false)
          result = context[:canvas_api].call("EXPORT_GROUPS_IN_AND_USERS_IN_CATEGORY").proxy(
            "EXPORT_GROUPS_IN_AND_USERS_IN_CATEGORY",
            {
              "group_category_id": group_category_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end