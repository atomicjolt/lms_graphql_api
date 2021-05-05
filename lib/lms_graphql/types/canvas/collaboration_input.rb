require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCollaborationInput < BaseInputObject
          description "Collaborations. API Docs: https://canvas.instructure.com/doc/api/collaborations.html"
      argument :id, ID, "The unique identifier for the collaboration.Example: 43", required: false
      argument :collaboration_type, String, "A name for the type of collaboration.Example: Microsoft Office", required: false
      argument :document_id, ID, "The collaboration document identifier for the collaboration provider.Example: oinwoenfe8w8ef_onweufe89fef", required: false
      argument :user_id, ID, "The canvas id of the user who created the collaboration.Example: 92", required: false
      argument :context_id, ID, "The canvas id of the course or group to which the collaboration belongs.Example: 77", required: false
      argument :context_type, String, "The canvas type of the course or group to which the collaboration belongs.Example: Course", required: false
      argument :url, String, "The LTI launch url to view collaboration..", required: false
      argument :created_at, LMSGraphQL::Types::DateTimeType, "The timestamp when the collaboration was created.Example: 2012-06-01T00:00:00-06:00", required: false
      argument :updated_at, LMSGraphQL::Types::DateTimeType, "The timestamp when the collaboration was last modified.Example: 2012-06-01T00:00:00-06:00", required: false
      argument :description, String, "", required: false
      argument :title, String, "", required: false
      argument :type, String, "Another representation of the collaboration type.Example: ExternalToolCollaboration", required: false
      argument :update_url, String, "The LTI launch url to edit the collaboration.", required: false
      argument :user_name, String, "The name of the user who owns the collaboration.Example: John Danger", required: false

      end
    end
  end
end