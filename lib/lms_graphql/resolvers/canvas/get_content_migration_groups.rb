require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetContentMigrationGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasContentMigration, null: false
        argument :group_id, ID, required: true
        argument :id, ID, required: true
        def resolve(group_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_CONTENT_MIGRATION_GROUPS").proxy(
            "GET_CONTENT_MIGRATION_GROUPS",
            {
              "group_id": group_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end