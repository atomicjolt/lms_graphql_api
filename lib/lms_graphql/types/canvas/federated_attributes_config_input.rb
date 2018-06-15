require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasFederatedAttributesConfigInput < BaseInputObject
        description "Authentication Providers. API Docs: https://canvas.instructure.com/doc/api/authentication_providers.html"
        argument :admin_roles, String, "A comma separated list of role names to grant to the user. Note that these only apply at the root account level, and not sub-accounts. If the attribute is not marked for provisioning only, the user will also be removed from any other roles they currently hold that are not still specified by the IdP..", required: false
        argument :display_name, String, "The full display name of the user.", required: false
        argument :email, String, "The user's e-mail address.", required: false
        argument :given_name, String, "The first, or given, name of the user.", required: false
        argument :integration_id, ID, "The secondary unique identifier for SIS purposes.", required: false
        argument :locale, String, "The user's preferred locale/language.", required: false
        argument :name, String, "The full name of the user.", required: false
        argument :sis_user_id, ID, "The unique SIS identifier.", required: false
        argument :sortable_name, String, "The full name of the user for sorting purposes.", required: false
        argument :surname, String, "The surname, or last name, of the user.", required: false
        argument :timezone, String, "The user's preferred time zone.", required: false

      end
    end
  end
end