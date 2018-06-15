require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class ListUserParticipant < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        argument :registration_status, String, required: false
        def resolve(id:, registration_status: nil)
          context[:canvas_api].call("LIST_USER_PARTICIPANTS").proxy(
            "LIST_USER_PARTICIPANTS",
            {
              "id": id,
              "registration_status": registration_status            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end