require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveObservee < CanvasBaseMutation
        argument :user_id, ID, required: true
        argument :observee_id, ID, required: true
        argument :root_account_id, ID, required: false
        field :user, LMSGraphQL::Types::Canvas::CanvasUser, null: false
        def resolve(user_id:, observee_id:, root_account_id: nil)
          context[:canvas_api].call("REMOVE_OBSERVEE").proxy(
            "REMOVE_OBSERVEE",
            {
              "user_id": user_id,
              "observee_id": observee_id,
              "root_account_id": root_account_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end