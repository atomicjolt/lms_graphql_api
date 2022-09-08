require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/line_item"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateLineItem < BaseMutation
        argument :course_id, ID, required: true
        argument :scoreMaximum, Float, required: true
        argument :label, String, required: true
        argument :resourceId, String, required: false
        argument :tag, String, required: false
        argument :resourceLinkId, String, required: false
        argument :endDateTime, String, required: false
        argument :lti_submission_type, String, required: false
        
        
        field :line_item, LMSGraphQL::Types::Canvas::CanvasLineItem, null: false
        
        def resolve(course_id:, scoreMaximum:, label:, resourceId: nil, tag: nil, resourceLinkId: nil, endDateTime: nil, lti_submission_type: nil)
          context[:canvas_api].call("CREATE_LINE_ITEM").proxy(
            "CREATE_LINE_ITEM",
            {
              "course_id": course_id
            },
            {
              "scoreMaximum": scoreMaximum,
              "label": label,
              "resourceId": resourceId,
              "tag": tag,
              "resourceLinkId": resourceLinkId,
              "endDateTime": endDateTime,
              "https://canvas.instructure.com/lti/submission_type": lti_submission_type
            },
          ).parsed_response
        end
      end
    end
  end
end