require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/blackout_date"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateBlackoutDateAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :start_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :end_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :event_title, String, required: false
        
        
        field :blackout_date, LMSGraphQL::Types::Canvas::CanvasBlackoutDate, null: false
        
        def resolve(account_id:, start_date: nil, end_date: nil, event_title: nil)
          context[:canvas_api].call("CREATE_BLACKOUT_DATE_ACCOUNTS").proxy(
            "CREATE_BLACKOUT_DATE_ACCOUNTS",
            {
              "account_id": account_id
            },
            {
              "start_date": start_date,
              "end_date": end_date,
              "event_title": event_title
            },
          ).parsed_response
        end
      end
    end
  end
end