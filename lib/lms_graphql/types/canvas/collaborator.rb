require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
        class CollaboratorTypeEnum < ::GraphQL::Schema::Enum
          value "user"
          value "group"
        end
      class CanvasCollaborator < BaseType
        description "Collaborations. API Docs: https://canvas.instructure.com/doc/api/collaborations.html"
      	field :id, ID, "The unique user or group identifier for the collaborator..Example: 12345", null: true
      	field :type, CollaboratorTypeEnum, "The type of collaborator (e.g. 'user' or 'group')..Example: user", null: true
      	field :name, String, "The name of the collaborator..Example: Don Draper", null: true

      end
    end
  end
end