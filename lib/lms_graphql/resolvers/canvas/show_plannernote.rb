require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/planner_note"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowPlannernote < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasPlannerNote, null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].proxy(
            "SHOW_PLANNERNOTE",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end