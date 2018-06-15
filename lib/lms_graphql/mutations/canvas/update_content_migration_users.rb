require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateContentMigrationUser < CanvasBaseMutation
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        field :content_migration, LMSGraphQL::Types::Canvas::CanvasContentMigration, null: false
        def resolve(user_id:, id:)
          context[:canvas_api].call("UPDATE_CONTENT_MIGRATION_USERS").proxy(
            "UPDATE_CONTENT_MIGRATION_USERS",
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