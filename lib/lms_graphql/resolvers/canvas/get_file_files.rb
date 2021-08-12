require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFileFile < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFile, null: false
        argument :id, ID, required: true
        argument :include, [String], required: false
        def resolve(id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_FILE_FILES").proxy(
            "GET_FILE_FILES",
            {
              "id": id,
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