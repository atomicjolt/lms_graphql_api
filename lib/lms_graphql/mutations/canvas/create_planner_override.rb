require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_override"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreatePlannerOverride < BaseMutation
        argument :plannable_type, String, required: true
        argument :plannable_id, ID, required: true
        argument :marked_complete, Boolean, required: false
        argument :dismissed, Boolean, required: false
        field :planner_override, LMSGraphQL::Types::Canvas::CanvasPlannerOverride, null: false
        def resolve(plannable_type:, plannable_id:, marked_complete: nil, dismissed: nil)
          context[:canvas_api].call("CREATE_PLANNER_OVERRIDE").proxy(
            "CREATE_PLANNER_OVERRIDE",
            {
              "plannable_type": plannable_type,
              "plannable_id": plannable_id,
              "marked_complete": marked_complete,
              "dismissed": dismissed            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end