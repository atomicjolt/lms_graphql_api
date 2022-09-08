require_relative "../canvas_base_type"
require_relative "./canvas_module_progress"

# This is a custom user type meant to handle data returned from get bulk user progress
# https://canvas.instructure.com/doc/api/all_resources.html#method.courses.bulk_user_progress
module LMSGraphQL
  module Types
    module CanvasBespoke
      class CanvasModuleUser < LMSGraphQL::Types::Canvas::BaseType
        description "A user specific to data returned from bulk_user_progress"
        field :id, ID, "The ID of the user..Example: 2", null: false
        field :display_name, String, "The name of the user that is should be used for sorting groups of users, such as in the gradebook..Example: Cooper, Sheldon", null: true
        field :avatar_image_url, String, "If avatars are enabled, this field will be included and contain a url to retrieve the user's avatar..Example: https://en.gravatar.com/avatar/d8cb8c8cd40ddf0cd05241443a591868?s=80&r=g", null: true
        field :html_url, String, "", null: true
        field :pronouns, String, "", null: true
        field :progress, [LMSGraphQL::Types::CanvasBespoke::CanvasModuleProgress], "An array of progress entries for the user in the provided course", null: true
      end
    end
  end
end
