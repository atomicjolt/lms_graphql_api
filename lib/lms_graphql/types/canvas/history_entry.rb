require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasHistoryEntry < BaseType
          description "History. API Docs: https://canvas.instructure.com/doc/api/history.html"
        field :asset_code, String, "The asset string for the item viewed.Example: assignment_123", null: true
        field :asset_name, String, "The name of the item.Example: Test Assignment", null: true
        field :asset_icon, String, "The icon type shown for the item. One of 'icon-announcement', 'icon-assignment', 'icon-calendar-month', 'icon-discussion', 'icon-document', 'icon-download', 'icon-gradebook', 'icon-home', 'icon-message', 'icon-module', 'icon-outcomes', 'icon-quiz', 'icon-user', 'icon-syllabus'.Example: icon-assignment", null: true
        field :asset_readable_category, String, "The associated category describing the asset_icon.Example: Assignment", null: true
        field :context_type, String, "The type of context of the item visited. One of 'Course', 'Group', 'User', or 'Account'.Example: Course", null: true
        field :context_id, ID, "The id of the context, if applicable.Example: 123", null: true
        field :context_name, String, "The name of the context.Example: Something 101", null: true
        field :visited_url, String, "The URL of the item.Example: https://canvas.example.com/courses/123/assignments/456", null: true
        field :visited_at, LMSGraphQL::Types::DateTimeType, "When the page was visited.Example: 2019-08-01T19:49:47Z", null: true
        field :interaction_seconds, Int, "The estimated time spent on the page in seconds.Example: 400", null: true

      end
    end
  end
end