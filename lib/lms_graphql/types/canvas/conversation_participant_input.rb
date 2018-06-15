require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasConversationParticipantInput < BaseInputObject
        description "Conversations. API Docs: https://canvas.instructure.com/doc/api/conversations.html"
        argument :id, ID, "The user ID for the participant..Example: 2", required: false
        argument :name, String, "A short name the user has selected, for use in conversations or other less formal places through the site..Example: Shelly", required: false
        argument :full_name, String, "The full name of the user..Example: Sheldon Cooper", required: false
        argument :avatar_url, String, "If requested, this field will be included and contain a url to retrieve the user's avatar..Example: https://canvas.instructure.com/images/messages/avatar-50.png", required: false

      end
    end
  end
end