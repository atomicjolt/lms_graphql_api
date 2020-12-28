require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasPairingCodeInput < BaseInputObject
        description "User Observees. API Docs: https://canvas.instructure.com/doc/api/user_observees.html"
      argument :user_id, ID, "The ID of the user..Example: 2", required: false
      argument :code, String, "The actual code to be sent to other APIs.Example: abc123", required: false
      argument :expires_at, String, "When the code expires.Example: 2012-05-30T17:45:25Z", required: false
      argument :workflow_state, String, "The current status of the code.Example: active", required: false

      end
    end
  end
end