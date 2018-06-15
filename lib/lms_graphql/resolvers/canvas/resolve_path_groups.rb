require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ResolvePathGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFolder], null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].call("RESOLVE_PATH_GROUPS").proxy(
            "RESOLVE_PATH_GROUPS",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end