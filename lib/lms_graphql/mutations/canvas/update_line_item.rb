require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/line_item"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateLineItem < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :scoreMaximum, Float, required: false
        argument :label, String, required: false
        argument :resourceId, String, required: false
        argument :tag, String, required: false
        field :line_item, LMSGraphQL::Types::Canvas::CanvasLineItem, null: false
        def resolve(course_id:, id:, scoreMaximum: nil, label: nil, resourceId: nil, tag: nil)
          context[:canvas_api].call("UPDATE_LINE_ITEM").proxy(
            "UPDATE_LINE_ITEM",
            {
              "course_id": course_id,
              "id": id
            },
            {
              "scoreMaximum": scoreMaximum,
              "label": label,
              "resourceId": resourceId,
              "tag": tag
            },
          ).parsed_response
        end
      end
    end
  end
end