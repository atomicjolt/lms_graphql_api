require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/content_migration"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateContentMigrationGroup < BaseMutation
        argument :group_id, ID, required: true
        argument :id, ID, required: true
        field :content_migration, LMSGraphQL::Types::Canvas::CanvasContentMigration, null: false
        def resolve(group_id:, id:)
          context[:canvas_api].call("UPDATE_CONTENT_MIGRATION_GROUPS").proxy(
            "UPDATE_CONTENT_MIGRATION_GROUPS",
            {
              "group_id": group_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end