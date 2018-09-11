require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasTermsOfServiceInput < BaseInputObject
        description "Accounts. API Docs: https://canvas.instructure.com/doc/api/accounts.html"
        argument :id, ID, "Terms Of Service id.Example: 1", required: false
        argument :terms_type, String, "The given type for the Terms of Service.Example: default", required: false
        argument :passive, Boolean, "Boolean dictating if the user must accept Terms of Service.", required: false
        argument :account_id, ID, "The id of the root account that owns the Terms of Service.Example: 1", required: false
        argument :content, String, "Content of the Terms of Service.Example: To be or not to be that is the question", required: false

      end
    end
  end
end