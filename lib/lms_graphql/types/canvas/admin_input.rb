require_relative "../canvas_base_input_type"
require_relative "user"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasAdminInput < BaseInputObject
        description "Admins. API Docs: https://canvas.instructure.com/doc/api/admins.html"
      argument :id, ID, "The unique identifier for the account role/user assignment..Example: 1023", required: false
      argument :role, String, "The account role assigned. This can be 'AccountAdmin' or a user-defined role created by the Roles API..Example: AccountAdmin", required: false
      argument :user, LMSGraphQL::Types::Canvas::CanvasUserInput, "The user the role is assigned to. See the Users API for details..", required: false
      argument :workflow_state, String, "The status of the account role/user assignment..Example: deleted", required: false

      end
    end
  end
end