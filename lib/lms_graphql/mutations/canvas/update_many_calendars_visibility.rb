require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/account_calendar"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateManyCalendarsVisibility < BaseMutation
        argument :account_id, ID, required: true
        
        
        field :account_calendar, LMSGraphQL::Types::Canvas::CanvasAccountCalendar, null: false
        
        def resolve(account_id:)
          context[:canvas_api].call("UPDATE_MANY_CALENDARS_VISIBILITY").proxy(
            "UPDATE_MANY_CALENDARS_VISIBILITY",
            {
              "account_id": account_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end