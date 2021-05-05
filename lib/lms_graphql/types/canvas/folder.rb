require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasFolder < BaseType
          description "Files. API Docs: https://canvas.instructure.com/doc/api/files.html"
        field :context_type, String, "Example: Course", null: true
        field :context_id, ID, "Example: 1401", null: true
        field :files_count, Int, "Example: 0", null: true
        field :position, Int, "Example: 3", null: true
        field :updated_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", null: true
        field :folders_url, String, "Example: https://www.example.com/api/v1/folders/2937/folders", null: true
        field :files_url, String, "Example: https://www.example.com/api/v1/folders/2937/files", null: true
        field :full_name, String, "Example: course files/11folder", null: true
        field :lock_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", null: true
        field :id, ID, "Example: 2937", null: true
        field :folders_count, Int, "Example: 0", null: true
        field :name, String, "Example: 11folder", null: true
        field :parent_folder_id, ID, "Example: 2934", null: true
        field :created_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", null: true
        field :unlock_at, LMSGraphQL::Types::DateTimeType, "", null: true
        field :hidden, Boolean, "", null: true
        field :hidden_for_user, Boolean, "", null: true
        field :locked, Boolean, "Example: true", null: true
        field :locked_for_user, Boolean, "", null: true
        field :for_submissions, Boolean, "If true, indicates this is a read-only folder containing files submitted to assignments.", null: true

      end
    end
  end
end