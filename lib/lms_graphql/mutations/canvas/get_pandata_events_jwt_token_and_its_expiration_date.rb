require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class GetPandataEventsJwtTokenAndItsExpirationDate < BaseMutation
        argument :app_key, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(app_key: nil)
          context[:canvas_api].call("GET_PANDATA_EVENTS_JWT_TOKEN_AND_ITS_EXPIRATION_DATE").proxy(
            "GET_PANDATA_EVENTS_JWT_TOKEN_AND_ITS_EXPIRATION_DATE",
            {},
            {
              "app_key": app_key
            },
          ).parsed_response
        end
      end
    end
  end
end