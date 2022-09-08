require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/user"
module LMSGraphQL
  module Mutations
    module Canvas
      class EditUser < BaseMutation
        argument :id, ID, required: true
        argument :user_name, String, required: false
        argument :user_short_name, String, required: false
        argument :user_sortable_name, String, required: false
        argument :user_time_zone, String, required: false
        argument :user_email, String, required: false
        argument :user_locale, String, required: false
        argument :user_avatar_token, String, required: false
        argument :user_avatar_url, String, required: false
        argument :user_title, String, required: false
        argument :user_bio, String, required: false
        argument :user_pronouns, String, required: false
        argument :user_event, String, required: false
        
        
        field :user, LMSGraphQL::Types::Canvas::CanvasUser, null: false
        
        def resolve(id:, user_name: nil, user_short_name: nil, user_sortable_name: nil, user_time_zone: nil, user_email: nil, user_locale: nil, user_avatar_token: nil, user_avatar_url: nil, user_title: nil, user_bio: nil, user_pronouns: nil, user_event: nil)
          context[:canvas_api].call("EDIT_USER").proxy(
            "EDIT_USER",
            {
              "id": id
            },
            {
              "user[name]": user_name,
              "user[short_name]": user_short_name,
              "user[sortable_name]": user_sortable_name,
              "user[time_zone]": user_time_zone,
              "user[email]": user_email,
              "user[locale]": user_locale,
              "user[avatar][token]": user_avatar_token,
              "user[avatar][url]": user_avatar_url,
              "user[title]": user_title,
              "user[bio]": user_bio,
              "user[pronouns]": user_pronouns,
              "user[event]": user_event
            },
          ).parsed_response
        end
      end
    end
  end
end