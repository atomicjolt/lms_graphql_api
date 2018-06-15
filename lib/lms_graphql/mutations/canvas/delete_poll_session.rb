require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePollSession < CanvasBaseMutation
        argument :poll_id, ID, required: true
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(poll_id:, id:)
          context[:canvas_api].call("DELETE_POLL_SESSION").proxy(
            "DELETE_POLL_SESSION",
            {
              "poll_id": poll_id,
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end