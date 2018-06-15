require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blueprint_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowBlueprintImport < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasBlueprintMigration, null: false
        argument :course_id, ID, required: true
        argument :subscription_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, subscription_id:, id:)
          context[:canvas_api].call("SHOW_BLUEPRINT_IMPORT").proxy(
            "SHOW_BLUEPRINT_IMPORT",
            {
              "course_id": course_id,
              "subscription_id": subscription_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end