require_relative "../canvas_base_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasAnonymousUserDisplay < BaseType
        description "Users. API Docs: https://canvas.instructure.com/doc/api/users.html"
        field :anonymous_id, ID, "A unique short ID identifying this user within the scope of a particular assignment..Example: xn29Q", null: true
        field :avatar_image_url, String, "A URL to retrieve a generic avatar..Example: https://en.gravatar.com/avatar/d8cb8c8cd40ddf0cd05241443a591868?s=80&r=g", null: true

      end
    end
  end
end