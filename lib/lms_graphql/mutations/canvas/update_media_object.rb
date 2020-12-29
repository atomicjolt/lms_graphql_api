require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateMediaObject < BaseMutation
        argument :media_object_id, ID, required: true
        argument :user_entered_title, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(media_object_id:, user_entered_title: nil)
          context[:canvas_api].call("UPDATE_MEDIA_OBJECT").proxy(
            "UPDATE_MEDIA_OBJECT",
            {
              "media_object_id": media_object_id
            },
            {
              "user_entered_title": user_entered_title
            },
          ).parsed_response
        end
      end
    end
  end
end