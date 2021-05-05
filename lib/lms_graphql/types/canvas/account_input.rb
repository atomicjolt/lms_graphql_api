require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAccountInput < BaseInputObject
          description "Accounts (LTI). API Docs: https://canvas.instructure.com/doc/api/accounts_(lti).html"
      argument :id, ID, "the ID of the Account object.Example: 2", required: false
      argument :name, String, "The display name of the account.Example: Canvas Account", required: false
      argument :uuid, String, "The UUID of the account.Example: WvAHhY5FINzq5IyRIJybGeiXyFkG3SqHUPb7jZY5", required: false
      argument :parent_account_id, ID, "The account's parent ID, or null if this is the root account.Example: 1", required: false
      argument :root_account_id, ID, "The ID of the root account, or null if this is the root account.Example: 1", required: false
      argument :workflow_state, String, "The state of the account. Can be 'active' or 'deleted'..Example: active", required: false

      end
    end
  end
end