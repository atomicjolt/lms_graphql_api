require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/section"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteSection < CanvasBaseMutation
        argument :id, ID, required: true
        field :section, LMSGraphQL::Types::Canvas::CanvasSection, null: false
        def resolve(id:)
          ctx[:canvas_api].proxy(
            "DELETE_SECTION",
            {
              "id": id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end