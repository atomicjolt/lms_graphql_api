require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/enrollment"
module LMSGraphQL
  module Mutations
    module Canvas
      class ConcludeDeactivateOrDeleteEnrollment < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :task, String, required: false
        field :enrollment, LMSGraphQL::Types::Canvas::CanvasEnrollment, null: false
        def resolve(course_id:, id:, task: nil)
          context[:canvas_api].call("CONCLUDE_DEACTIVATE_OR_DELETE_ENROLLMENT").proxy(
            "CONCLUDE_DEACTIVATE_OR_DELETE_ENROLLMENT",
            {
              "course_id": course_id,
              "id": id,
              "task": task
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end