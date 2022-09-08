require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeCrossListSection < BaseMutation
        argument :id, ID, required: true
        argument :override_sis_stickiness, Boolean, required: false
        
        
        field :section, LMSGraphQL::Types::Canvas::CanvasSection, null: false
        
        def resolve(id:, override_sis_stickiness: nil)
          context[:canvas_api].call("DE_CROSS_LIST_SECTION").proxy(
            "DE_CROSS_LIST_SECTION",
            {
              "id": id,
              "override_sis_stickiness": override_sis_stickiness
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end