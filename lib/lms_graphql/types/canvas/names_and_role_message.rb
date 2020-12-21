require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasNamesAndRoleMessage < BaseType
        description "Names and Role. API Docs: https://canvas.instructure.com/doc/api/names_and_role.html"
      	field :message_type, String, "The type of LTI message being described. Always set to 'LtiResourceLinkRequest'.Example: LtiResourceLinkRequest", null: true
      	field :locale, String, "The member's preferred locale.Example: en", null: true
      	field :canvas_user_id, ID, "The member's API ID.Example: 1", null: true
      	field :canvas_user_login_id, ID, "The member's primary login username.Example: showell@school.edu", null: true
      	field :custom, String, "Expanded LTI custom parameters that pertain to the member (as opposed to the Context).Example: en, America/Denver", null: true

      end
    end
  end
end