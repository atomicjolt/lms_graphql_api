require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListContentMigrationsGroup < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasContentMigration], null: false
        argument :group_id, ID, required: true
        def resolve(group_id:)
          context[:canvas_api].proxy(
            "LIST_CONTENT_MIGRATIONS_GROUPS",
            {
              "group_id": group_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end