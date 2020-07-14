require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/conference"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListConferencesForCurrentUser < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasConference], null: false
        argument :get_all, Boolean, required: false
        argument :state, String, required: false
        def resolve(state: nil, get_all: false)
          result = context[:canvas_api].call("LIST_CONFERENCES_FOR_CURRENT_USER").proxy(
            "LIST_CONFERENCES_FOR_CURRENT_USER",
            {
              "state": state            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end