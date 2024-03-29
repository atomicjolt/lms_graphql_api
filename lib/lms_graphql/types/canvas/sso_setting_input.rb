require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasSSOSettingInput < BaseInputObject
          description "Authentication Providers. API Docs: https://canvas.instructure.com/doc/api/authentication_providers.html"
        argument :login_handle_name, String, "The label used for unique login identifiers..Example: Username", required: false
        argument :change_password_url, String, "The url to redirect users to for password resets. Leave blank for default Canvas behavior.Example: https://example.com/reset_password", required: false
        argument :auth_discovery_url, String, "If a discovery url is set, canvas will forward all users to that URL when they need to be authenticated. That page will need to then help the user figure out where they need to go to log in. If no discovery url is configured, the first configuration will be used to attempt to authenticate the user..Example: https://example.com/which_account", required: false
        argument :unknown_user_url, String, "If an unknown user url is set, Canvas will forward to that url when a service authenticates a user, but that user does not exist in Canvas. The default behavior is to present an error..Example: https://example.com/register_for_canvas", required: false

      end
    end
  end
end