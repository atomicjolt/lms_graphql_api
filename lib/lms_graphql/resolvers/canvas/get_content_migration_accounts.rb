require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetContentMigrationAccount < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasContentMigration, null: false
        argument :account_id, ID, required: true
        argument :id, ID, required: true
        def resolve(account_id:, id:)
          context[:canvas_api].call("GET_CONTENT_MIGRATION_ACCOUNTS").proxy(
            "GET_CONTENT_MIGRATION_ACCOUNTS",
            {
              "account_id": account_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end