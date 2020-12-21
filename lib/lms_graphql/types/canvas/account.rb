require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAccount < BaseType
        description "Accounts (LTI). API Docs: https://canvas.instructure.com/doc/api/accounts_(lti).html"
      	field :id, ID, "the ID of the Account object.Example: 2", null: true
      	field :name, String, "The display name of the account.Example: Canvas Account", null: true
      	field :uuid, String, "The UUID of the account.Example: WvAHhY5FINzq5IyRIJybGeiXyFkG3SqHUPb7jZY5", null: true
      	field :parent_account_id, ID, "The account's parent ID, or null if this is the root account.Example: 1", null: true
      	field :root_account_id, ID, "The ID of the root account, or null if this is the root account.Example: 1", null: true
      	field :workflow_state, String, "The state of the account. Can be 'active' or 'deleted'..Example: active", null: true

      end
    end
  end
end