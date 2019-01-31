require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowObservee < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasUser, null: false
        argument :user_id, ID, required: true
        argument :observee_id, ID, required: true
        def resolve(user_id:, observee_id:, get_all: false)
          result = context[:canvas_api].call("SHOW_OBSERVEE").proxy(
            "SHOW_OBSERVEE",
            {
              "user_id": user_id,
              "observee_id": observee_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end