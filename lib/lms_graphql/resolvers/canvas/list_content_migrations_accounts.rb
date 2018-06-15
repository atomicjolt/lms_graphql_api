require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListContentMigrationsAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasContentMigration], null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("LIST_CONTENT_MIGRATIONS_ACCOUNTS").proxy(
            "LIST_CONTENT_MIGRATIONS_ACCOUNTS",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end