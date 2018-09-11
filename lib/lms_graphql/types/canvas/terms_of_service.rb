require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasTermsOfService < BaseType
        description "Accounts. API Docs: https://canvas.instructure.com/doc/api/accounts.html"
        field :id, ID, "Terms Of Service id.Example: 1", null: true
        field :terms_type, String, "The given type for the Terms of Service.Example: default", null: true
        field :passive, Boolean, "Boolean dictating if the user must accept Terms of Service.", null: true
        field :account_id, ID, "The id of the root account that owns the Terms of Service.Example: 1", null: true
        field :content, String, "Content of the Terms of Service.Example: To be or not to be that is the question", null: true

      end
    end
  end
end