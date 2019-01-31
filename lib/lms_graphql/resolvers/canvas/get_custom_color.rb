require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetCustomColor < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        argument :asset_string, String, required: true
        def resolve(id:, asset_string:, get_all: false)
          result = context[:canvas_api].call("GET_CUSTOM_COLOR").proxy(
            "GET_CUSTOM_COLOR",
            {
              "id": id,
              "asset_string": asset_string            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end