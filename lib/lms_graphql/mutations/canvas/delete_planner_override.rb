require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_override"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePlannerOverride < BaseMutation
        argument :id, ID, required: true
        field :planner_override, LMSGraphQL::Types::Canvas::CanvasPlannerOverride, null: false
        def resolve(id:)
          context[:canvas_api].call("DELETE_PLANNER_OVERRIDE").proxy(
            "DELETE_PLANNER_OVERRIDE",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end