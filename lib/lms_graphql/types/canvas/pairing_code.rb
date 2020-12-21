require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasPairingCode < BaseType
        description "User Observees. API Docs: https://canvas.instructure.com/doc/api/user_observees.html"
      	field :user_id, ID, "The ID of the user..Example: 2", null: true
      	field :code, String, "The actual code to be sent to other APIs.Example: abc123", null: true
      	field :expires_at, String, "When the code expires.Example: 2012-05-30T17:45:25Z", null: true
      	field :workflow_state, String, "The current status of the code.Example: active", null: true

      end
    end
  end
end