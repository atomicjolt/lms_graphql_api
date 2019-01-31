require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/blueprint_migration"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListBlueprintImport < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasBlueprintMigration], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :subscription_id, ID, required: true
        def resolve(course_id:, subscription_id:, get_all: false)
          result = context[:canvas_api].call("LIST_BLUEPRINT_IMPORTS").proxy(
            "LIST_BLUEPRINT_IMPORTS",
            {
              "course_id": course_id,
              "subscription_id": subscription_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end