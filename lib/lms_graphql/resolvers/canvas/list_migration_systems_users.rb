require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/migrator"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListMigrationSystemsUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasMigrator], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        def resolve(user_id:, get_all: false)
          result = context[:canvas_api].call("LIST_MIGRATION_SYSTEMS_USERS").proxy(
            "LIST_MIGRATION_SYSTEMS_USERS",
            {
              "user_id": user_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end