require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GroupActivityStream < CanvasBaseResolver
        type Boolean, null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].call("GROUP_ACTIVITY_STREAM").proxy(
            "GROUP_ACTIVITY_STREAM",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end