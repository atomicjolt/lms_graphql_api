require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blueprint_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowBlueprintMigration < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::BlueprintMigration, null: false
        argument :course_id, ID, required: true
        argument :template_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, template_id:, id:)
          context[:canvas_api].proxy(
            "SHOW_BLUEPRINT_MIGRATION",
            {
              "course_id": course_id,
              "template_id": template_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end