require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/bookmark"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateBookmark < BaseMutation
        argument :name, String, required: false
        argument :url, String, required: false
        argument :position, Int, required: false
        argument :data, String, required: false
        field :bookmark, LMSGraphQL::Types::Canvas::CanvasBookmark, null: false
        def resolve(name: nil, url: nil, position: nil, data: nil)
          context[:canvas_api].call("CREATE_BOOKMARK").proxy(
            "CREATE_BOOKMARK",
            {
              "name": name,
              "url": url,
              "position": position,
              "data": data            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end