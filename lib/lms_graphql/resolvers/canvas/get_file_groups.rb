require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFileGroup < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFile, null: false
        argument :group_id, ID, required: true
        argument :id, ID, required: true
        argument :include, [String], required: false
        def resolve(group_id:, id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_FILE_GROUPS").proxy(
            "GET_FILE_GROUPS",
            {
              "group_id": group_id,
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