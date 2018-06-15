require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateDashboardPosition < CanvasBaseMutation
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(id:)
          context[:canvas_api].call("UPDATE_DASHBOARD_POSITIONS").proxy(
            "UPDATE_DASHBOARD_POSITIONS",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end