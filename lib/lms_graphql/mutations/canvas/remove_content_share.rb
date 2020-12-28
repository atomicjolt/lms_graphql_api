require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveContentShare < BaseMutation
        argument :user_id, ID, required: true
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(user_id:, id:)
          context[:canvas_api].call("REMOVE_CONTENT_SHARE").proxy(
            "REMOVE_CONTENT_SHARE",
            {
              "user_id": user_id,
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end