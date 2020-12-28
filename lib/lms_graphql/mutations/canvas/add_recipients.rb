require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class AddRecipient < BaseMutation
        argument :id, ID, required: true
        argument :recipients, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:, recipients:)
          context[:canvas_api].call("ADD_RECIPIENTS").proxy(
            "ADD_RECIPIENTS",
            {
              "id": id
            },
            {
              "recipients": recipients
            },
          ).parsed_response
        end
      end
    end
  end
end