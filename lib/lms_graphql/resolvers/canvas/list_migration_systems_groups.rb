require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migrator"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMigrationSystemsGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasMigrator], null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].call("LIST_MIGRATION_SYSTEMS_GROUPS").proxy(
            "LIST_MIGRATION_SYSTEMS_GROUPS",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end