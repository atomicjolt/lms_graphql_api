require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/planner_note"
module LMSGraphQL
  module Mutations
    module Canvas
      class UpdatePlannerNote < BaseMutation
        argument :id, ID, required: true
        argument :title, String, required: false
        argument :details, String, required: false
        argument :todo_date, GraphQL::Types::ISO8601DateTime, required: false
        argument :course_id, ID, required: false
        
        
        field :planner_note, LMSGraphQL::Types::Canvas::CanvasPlannerNote, null: false
        
        def resolve(id:, title: nil, details: nil, todo_date: nil, course_id: nil)
          context[:canvas_api].call("UPDATE_PLANNER_NOTE").proxy(
            "UPDATE_PLANNER_NOTE",
            {
              "id": id
            },
            {
              "title": title,
              "details": details,
              "todo_date": todo_date,
              "course_id": course_id
            },
          ).parsed_response
        end
      end
    end
  end
end