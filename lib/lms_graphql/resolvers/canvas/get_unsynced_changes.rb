require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/change_record"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetUnsyncedChange < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasChangeRecord], null: false
        argument :course_id, ID, required: true
        argument :template_id, ID, required: true
        def resolve(course_id:, template_id:)
          context[:canvas_api].call("GET_UNSYNCED_CHANGES").proxy(
            "GET_UNSYNCED_CHANGES",
            {
              "course_id": course_id,
              "template_id": template_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end