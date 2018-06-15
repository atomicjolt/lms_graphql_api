require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetContentMigrationUser < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasContentMigration, null: false
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        def resolve(user_id:, id:)
          context[:canvas_api].call("GET_CONTENT_MIGRATION_USERS").proxy(
            "GET_CONTENT_MIGRATION_USERS",
            {
              "user_id": user_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end