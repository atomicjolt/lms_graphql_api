require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/pairing_code"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateObserverPairingCode < BaseMutation
        argument :user_id, ID, required: true
        field :pairing_code, LMSGraphQL::Types::Canvas::CanvasPairingCode, null: false
        def resolve(user_id:)
          context[:canvas_api].call("CREATE_OBSERVER_PAIRING_CODE").proxy(
            "CREATE_OBSERVER_PAIRING_CODE",
            {
              "user_id": user_id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end