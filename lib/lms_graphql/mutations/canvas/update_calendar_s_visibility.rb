require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/account_calendar"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateCalendarSVisibility < BaseMutation
        argument :account_id, ID, required: true
        argument :visible, Boolean, required: false
        
        
        field :account_calendar, LMSGraphQL::Types::Canvas::CanvasAccountCalendar, null: false
        
        def resolve(account_id:, visible: nil)
          context[:canvas_api].call("UPDATE_CALENDAR_S_VISIBILITY").proxy(
            "UPDATE_CALENDAR_S_VISIBILITY",
            {
              "account_id": account_id
            },
            {
              "visible": visible
            },
          ).parsed_response
        end
      end
    end
  end
end