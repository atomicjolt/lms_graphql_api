require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class Permission < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        argument :permissions, String, required: false
        def resolve(group_id:, permissions: nil)
          context[:canvas_api].call("PERMISSIONS").proxy(
            "PERMISSIONS",
            {
              "group_id": group_id,
              "permissions": permissions            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end