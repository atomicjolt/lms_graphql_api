require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeletePoll < BaseMutation
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:)
          context[:canvas_api].call("DELETE_POLL").proxy(
            "DELETE_POLL",
            {
              "id": id
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end