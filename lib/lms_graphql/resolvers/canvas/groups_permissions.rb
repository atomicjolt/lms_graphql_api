require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GroupsPermission < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        argument :permissions, [String], required: false
        def resolve(group_id:, permissions: nil, get_all: false)
          result = context[:canvas_api].call("GROUPS_PERMISSIONS").proxy(
            "GROUPS_PERMISSIONS",
            {
              "group_id": group_id,
              "permissions": permissions            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end