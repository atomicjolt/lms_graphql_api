require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class SaveEnabledAccountCalendar < BaseMutation

        
        
        field :return_value, Boolean, null: false
        
        def resolve()
          context[:canvas_api].call("SAVE_ENABLED_ACCOUNT_CALENDARS").proxy(
            "SAVE_ENABLED_ACCOUNT_CALENDARS",
            {},
            {},
          ).parsed_response
        end
      end
    end
  end
end