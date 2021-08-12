require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteMessage < BaseMutation
        argument :id, ID, required: true
        argument :remove, [String], required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:, remove:)
          context[:canvas_api].call("DELETE_MESSAGE").proxy(
            "DELETE_MESSAGE",
            {
              "id": id
            },
            {
              "remove": remove
            },
          ).parsed_response
        end
      end
    end
  end
end