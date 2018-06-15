require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/file"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteFile < CanvasBaseMutation
        argument :id, ID, required: true
        argument :replace, Boolean, required: false
        field :file, LMSGraphQL::Types::Canvas::CanvasFile, null: false
        def resolve(id:, replace: nil)
          ctx[:canvas_api].proxy(
            "DELETE_FILE",
            {
              "id": id,
              "replace": replace            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end