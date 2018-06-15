require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_note"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreatePlannerNote < BaseMutation
        argument :title, String, required: false
        argument :details, String, required: false
        argument :todo_date, LMSGraphQL::Types::DateTimeType, required: false
        argument :course_id, ID, required: false
        argument :linked_object_type, String, required: false
        argument :linked_object_id, ID, required: false
        field :planner_note, LMSGraphQL::Types::Canvas::CanvasPlannerNote, null: false
        def resolve(title: nil, details: nil, todo_date: nil, course_id: nil, linked_object_type: nil, linked_object_id: nil)
          context[:canvas_api].call("CREATE_PLANNER_NOTE").proxy(
            "CREATE_PLANNER_NOTE",
            {
              "title": title,
              "details": details,
              "todo_date": todo_date,
              "course_id": course_id,
              "linked_object_type": linked_object_type,
              "linked_object_id": linked_object_id            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end