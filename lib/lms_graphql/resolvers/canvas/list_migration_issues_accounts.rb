require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migration_issue"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMigrationIssuesAccount < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasMigrationIssue], null: false
        argument :get_all, Boolean, required: false
        argument :account_id, ID, required: true
        argument :content_migration_id, ID, required: true
        def resolve(account_id:, content_migration_id:, get_all: false)
          result = context[:canvas_api].call("LIST_MIGRATION_ISSUES_ACCOUNTS").proxy(
            "LIST_MIGRATION_ISSUES_ACCOUNTS",
            {
              "account_id": account_id,
              "content_migration_id": content_migration_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end