require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListObservee < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasUser], null: false
        argument :get_all, Boolean, required: false
        argument :user_id, ID, required: true
        argument :include, String, required: false
        def resolve(user_id:, include: nil, get_all: false)
          result = context[:canvas_api].call("LIST_OBSERVEES").proxy(
            "LIST_OBSERVEES",
            {
              "user_id": user_id,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end