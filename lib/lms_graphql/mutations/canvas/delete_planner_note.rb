require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_note"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePlannerNote < CanvasBaseMutation
        argument :id, ID, required: true
        field :planner_note, LMSGraphQL::Types::Canvas::CanvasPlannerNote, null: false
        def resolve(id:)
          context[:canvas_api].call("DELETE_PLANNER_NOTE").proxy(
            "DELETE_PLANNER_NOTE",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end