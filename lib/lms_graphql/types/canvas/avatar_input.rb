require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAvatarInput < BaseInputObject
        description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
      	argument :type, String, "['gravatar'|'attachment'|'no_pic'] The type of avatar record, for categorization purposes..Example: gravatar", required: false
      	argument :url, String, "The url of the avatar.Example: https://secure.gravatar.com/avatar/2284.", required: false
      	argument :token, String, "A unique representation of the avatar record which can be used to set the avatar with the user update endpoint. Note: this is an internal representation and is subject to change without notice. It should be consumed with this api endpoint and used in the user update endpoint, and should not be constructed by the client..Example: <opaque_token>", required: false
      	argument :display_name, String, "A textual description of the avatar record..Example: user, sample", required: false
      	argument :id, ID, "['attachment' type only] the internal id of the attachment.Example: 12", required: false
      	argument :content_type, String, "['attachment' type only] the content-type of the attachment..Example: image/jpeg", required: false
      	argument :filename, String, "['attachment' type only] the filename of the attachment.Example: profile.jpg", required: false
      	argument :size, Int, "['attachment' type only] the size of the attachment.Example: 32649", required: false

      end
    end
  end
end