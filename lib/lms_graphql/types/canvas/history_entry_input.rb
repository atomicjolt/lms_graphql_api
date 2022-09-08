require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasHistoryEntryInput < BaseInputObject
          description "History. API Docs: https://canvas.instructure.com/doc/api/history.html"
        argument :asset_code, String, "The asset string for the item viewed.Example: assignment_123", required: false
        argument :asset_name, String, "The name of the item.Example: Test Assignment", required: false
        argument :asset_icon, String, "The icon type shown for the item. One of 'icon-announcement', 'icon-assignment', 'icon-calendar-month', 'icon-discussion', 'icon-document', 'icon-download', 'icon-gradebook', 'icon-home', 'icon-message', 'icon-module', 'icon-outcomes', 'icon-quiz', 'icon-user', 'icon-syllabus'.Example: icon-assignment", required: false
        argument :asset_readable_category, String, "The associated category describing the asset_icon.Example: Assignment", required: false
        argument :context_type, String, "The type of context of the item visited. One of 'Course', 'Group', 'User', or 'Account'.Example: Course", required: false
        argument :context_id, ID, "The id of the context, if applicable.Example: 123", required: false
        argument :context_name, String, "The name of the context.Example: Something 101", required: false
        argument :visited_url, String, "The URL of the item.Example: https://canvas.example.com/courses/123/assignments/456", required: false
        argument :visited_at, GraphQL::Types::ISO8601DateTime, "When the page was visited.Example: 2019-08-01T19:49:47Z", required: false
        argument :interaction_seconds, Int, "The estimated time spent on the page in seconds.Example: 400", required: false

      end
    end
  end
end