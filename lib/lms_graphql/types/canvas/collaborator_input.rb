require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
        class CollaboratorTypeEnum < ::GraphQL::Schema::Enum
          value "user"
          value "group"
        end
      class CanvasCollaboratorInput < BaseInputObject
        description "Collaborations. API Docs: https://canvas.instructure.com/doc/api/collaborations.html"
      	argument :id, ID, "The unique user or group identifier for the collaborator..Example: 12345", required: false
      	argument :type, CollaboratorTypeEnum, "The type of collaborator (e.g. 'user' or 'group')..Example: user", required: false
      	argument :name, String, "The name of the collaborator..Example: Don Draper", required: false

      end
    end
  end
end