require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ResolvePathGroupsFullPath < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFolder], null: false
        argument :get_all, Boolean, required: false
        argument :group_id, ID, required: true
        def resolve(group_id:, get_all: false)
          result = context[:canvas_api].call("RESOLVE_PATH_GROUPS_FULL_PATH").proxy(
            "RESOLVE_PATH_GROUPS_FULL_PATH",
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