require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ShowObserver < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasUser, null: false
        argument :user_id, ID, required: true
        argument :observer_id, ID, required: true
        def resolve(user_id:, observer_id:, get_all: false)
          result = context[:canvas_api].call("SHOW_OBSERVER").proxy(
            "SHOW_OBSERVER",
            {
              "user_id": user_id,
              "observer_id": observer_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end