require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteCalendarEvent < BaseMutation
        argument :id, ID, required: true
        argument :cancel_reason, String, required: false
        argument :which, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:, cancel_reason: nil, which: nil)
          context[:canvas_api].call("DELETE_CALENDAR_EVENT").proxy(
            "DELETE_CALENDAR_EVENT",
            {
              "id": id,
              "cancel_reason": cancel_reason,
              "which": which
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end