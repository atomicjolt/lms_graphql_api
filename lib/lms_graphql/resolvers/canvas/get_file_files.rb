require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetFileFile < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasFile, null: false
        argument :id, ID, required: true
        argument :include, [String], required: false
        argument :replacement_chain_context_type, String, required: false
        argument :replacement_chain_context_id, ID, required: false
        def resolve(id:, include: nil, replacement_chain_context_type: nil, replacement_chain_context_id: nil, get_all: false)
          result = context[:canvas_api].call("GET_FILE_FILES").proxy(
            "GET_FILE_FILES",
            {
              "id": id,
              "include": include,
              "replacement_chain_context_type": replacement_chain_context_type,
              "replacement_chain_context_id": replacement_chain_context_id            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end