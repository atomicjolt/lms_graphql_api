require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class GetPandataJwtTokenAndItsExpirationDate < CanvasBaseMutation
        argument :id, ID, required: true
        argument :app_key, String, required: false
        field :return_value, Boolean, null: false
        def resolve(id:, app_key: nil)
          context[:canvas_api].call("GET_PANDATA_JWT_TOKEN_AND_ITS_EXPIRATION_DATE").proxy(
            "GET_PANDATA_JWT_TOKEN_AND_ITS_EXPIRATION_DATE",
            {
              "id": id,
              "app_key": app_key            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end