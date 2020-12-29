require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeCrossListSection < BaseMutation
        argument :id, ID, required: true
        
        
        field :section, LMSGraphQL::Types::Canvas::CanvasSection, null: false
        
        def resolve(id:)
          context[:canvas_api].call("DE_CROSS_LIST_SECTION").proxy(
            "DE_CROSS_LIST_SECTION",
            {
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end