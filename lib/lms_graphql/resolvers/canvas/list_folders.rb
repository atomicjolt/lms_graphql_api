require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/folder"
module LMSGraphQL
  module Resolvers
    module Canvas
      class ListFolder < CanvasBaseResolver
        type [LMSGraphQL::Types::Canvas::CanvasFolder], null: false
        argument :id, ID, required: true
        def resolve(id:)
          context[:canvas_api].call("LIST_FOLDERS").proxy(
            "LIST_FOLDERS",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end