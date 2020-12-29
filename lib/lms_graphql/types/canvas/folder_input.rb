require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasFolderInput < BaseInputObject
        description "Files. API Docs: https://canvas.instructure.com/doc/api/files.html"
      argument :context_type, String, "Example: Course", required: false
      argument :context_id, ID, "Example: 1401", required: false
      argument :files_count, Int, "Example: 0", required: false
      argument :position, Int, "Example: 3", required: false
      argument :updated_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", required: false
      argument :folders_url, String, "Example: https://www.example.com/api/v1/folders/2937/folders", required: false
      argument :files_url, String, "Example: https://www.example.com/api/v1/folders/2937/files", required: false
      argument :full_name, String, "Example: course files/11folder", required: false
      argument :lock_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", required: false
      argument :id, ID, "Example: 2937", required: false
      argument :folders_count, Int, "Example: 0", required: false
      argument :name, String, "Example: 11folder", required: false
      argument :parent_folder_id, ID, "Example: 2934", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "Example: 2012-07-06T14:58:50Z", required: false
      argument :unlock_at, LMSGraphQL::Types::DateTimeType, "", required: false
      argument :hidden, Boolean, "", required: false
      argument :hidden_for_user, Boolean, "", required: false
      argument :locked, Boolean, "Example: true", required: false
      argument :locked_for_user, Boolean, "", required: false
      argument :for_submissions, Boolean, "If true, indicates this is a read-only folder containing files submitted to assignments.", required: false

      end
    end
  end
end