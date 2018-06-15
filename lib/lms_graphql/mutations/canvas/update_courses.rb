require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/progress"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateCourse < BaseMutation
        argument :account_id, ID, required: true
        argument :course_ids, [ID], required: true
        argument :event, String, required: true
        field :progress, LMSGraphQL::Types::Canvas::CanvasProgress, null: false
        def resolve(account_id:, course_ids:, event:)
          context[:canvas_api].call("UPDATE_COURSES").proxy(
            "UPDATE_COURSES",
            {
              "account_id": account_id,
              "course_ids": course_ids,
              "event": event            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end