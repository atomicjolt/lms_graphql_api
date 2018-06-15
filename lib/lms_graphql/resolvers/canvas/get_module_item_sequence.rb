require_relative "../canvas_base_resolver"
require_relative "../../types/canvas/module_item_sequence"
module LMSGraphQL
  module Resolvers
    module Canvas
      class GetModuleItemSequence < CanvasBaseResolver
        type LMSGraphQL::Types::Canvas::CanvasModuleItemSequence, null: false
        argument :course_id, ID, required: true
        argument :asset_type, String, required: false
        argument :asset_id, ID, required: false
        def resolve(course_id:, asset_type: nil, asset_id: nil)
          context[:canvas_api].call("GET_MODULE_ITEM_SEQUENCE").proxy(
            "GET_MODULE_ITEM_SEQUENCE",
            {
              "course_id": course_id,
              "asset_type": asset_type,
              "asset_id": asset_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end