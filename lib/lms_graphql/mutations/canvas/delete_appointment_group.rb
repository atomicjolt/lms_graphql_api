require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteAppointmentGroup < CanvasBaseMutation
        argument :id, ID, required: true
        argument :cancel_reason, String, required: false
        field :return_value, Boolean, null: false
        def resolve(id:, cancel_reason: nil)
          context[:canvas_api].call("DELETE_APPOINTMENT_GROUP").proxy(
            "DELETE_APPOINTMENT_GROUP",
            {
              "id": id,
              "cancel_reason": cancel_reason            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end