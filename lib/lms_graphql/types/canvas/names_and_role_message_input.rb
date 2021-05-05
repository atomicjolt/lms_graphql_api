require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasNamesAndRoleMessageInput < BaseInputObject
          description "Names and Role. API Docs: https://canvas.instructure.com/doc/api/names_and_role.html"
      argument :message_type, String, "The type of LTI message being described. Always set to 'LtiResourceLinkRequest'.Example: LtiResourceLinkRequest", required: false
      argument :locale, String, "The member's preferred locale.Example: en", required: false
      argument :canvas_user_id, ID, "The member's API ID.Example: 1", required: false
      argument :canvas_user_login_id, ID, "The member's primary login username.Example: showell@school.edu", required: false
      argument :custom, String, "Expanded LTI custom parameters that pertain to the member (as opposed to the Context).Example: en, America/Denver", required: false

      end
    end
  end
end