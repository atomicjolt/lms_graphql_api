require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/line_item"
module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteLineItem < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        field :line_item, LMSGraphQL::Types::Canvas::CanvasLineItem, null: false
        def resolve(course_id:, id:)
          context[:canvas_api].call("DELETE_LINE_ITEM").proxy(
            "DELETE_LINE_ITEM",
            {
              "course_id": course_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end