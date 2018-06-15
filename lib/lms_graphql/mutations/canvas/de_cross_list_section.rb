require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeCrossListSection < CanvasBaseMutation
        argument :id, ID, required: true
        field :section, LMSGraphQL::Types::Canvas::CanvasSection, null: false
        def resolve(id:)
          context[:canvas_api].call("DE_CROSS_LIST_SECTION").proxy(
            "DE_CROSS_LIST_SECTION",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end