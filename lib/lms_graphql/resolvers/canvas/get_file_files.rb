require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFileFile < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::File, null: false
        argument :id, ID, required: true
        argument :include, String, required: false
        def resolve(id:, include: nil)
          context[:canvas_api].proxy(
            "GET_FILE_FILES",
            {
              "id": id,
              "include": include            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end