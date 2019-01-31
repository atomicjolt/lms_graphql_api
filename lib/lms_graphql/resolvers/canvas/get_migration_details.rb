require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/change_record"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetMigrationDetail < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasChangeRecord], null: false
        argument :get_all, Boolean, required: false
        argument :course_id, ID, required: true
        argument :template_id, ID, required: true
        argument :id, ID, required: true
        def resolve(course_id:, template_id:, id:, get_all: false)
          result = context[:canvas_api].call("GET_MIGRATION_DETAILS").proxy(
            "GET_MIGRATION_DETAILS",
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