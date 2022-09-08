require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasFederatedAttributeConfigInput < BaseInputObject
          description "Authentication Providers. API Docs: https://canvas.instructure.com/doc/api/authentication_providers.html"
        argument :attribute, String, "The name of the attribute as it will be sent from the authentication provider.Example: mail", required: false
        argument :provisioning_only, Boolean, "If the attribute should be applied only when provisioning a new user, rather than all logins.", required: false

      end
    end
  end
end