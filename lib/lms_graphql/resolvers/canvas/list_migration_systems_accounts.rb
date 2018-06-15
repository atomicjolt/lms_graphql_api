require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migrator"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMigrationSystemsAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasMigrator], null: false
        argument :account_id, ID, required: true
        def resolve(account_id:)
          context[:canvas_api].call("LIST_MIGRATION_SYSTEMS_ACCOUNTS").proxy(
            "LIST_MIGRATION_SYSTEMS_ACCOUNTS",
            {
              "account_id": account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end