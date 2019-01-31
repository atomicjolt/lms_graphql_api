require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blueprint_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowBlueprintMigration < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasBlueprintMigration, null: false
        argument :course_id, ID, required: true
        argument :template_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, template_id:, id:, get_all: false)
          result = context[:canvas_api].call("SHOW_BLUEPRINT_MIGRATION").proxy(
            "SHOW_BLUEPRINT_MIGRATION",
            {
              "course_id": course_id,
              "template_id": template_id,
              "id": id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end