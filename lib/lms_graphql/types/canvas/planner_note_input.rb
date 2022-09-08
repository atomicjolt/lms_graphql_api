require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasPlannerNoteInput < BaseInputObject
          description "Planner. API Docs: https://canvas.instructure.com/doc/api/planner.html"
        argument :id, ID, "The ID of the planner note.Example: 234", required: false
        argument :title, String, "The title for a planner note.Example: Bring books tomorrow", required: false
        argument :description, String, "The description of the planner note.Example: I need to bring books tomorrow for my course on biology", required: false
        argument :user_id, ID, "The id of the associated user creating the planner note.Example: 1578941", required: false
        argument :workflow_state, String, "The current published state of the planner note.Example: active", required: false
        argument :course_id, ID, "The course that the note is in relation too, if applicable.Example: 1578941", required: false
        argument :todo_date, GraphQL::Types::ISO8601DateTime, "The datetime of when the planner note should show up on their planner.Example: 2017-05-09T10:12:00Z", required: false
        argument :linked_object_type, String, "the type of the linked learning object.Example: assignment", required: false
        argument :linked_object_id, ID, "the id of the linked learning object.Example: 131072", required: false
        argument :linked_object_html_url, String, "the Canvas web URL of the linked learning object.Example: https://canvas.example.com/courses/1578941/assignments/131072", required: false
        argument :linked_object_url, String, "the API URL of the linked learning object.Example: https://canvas.example.com/api/v1/courses/1578941/assignments/131072", required: false

      end
    end
  end
end