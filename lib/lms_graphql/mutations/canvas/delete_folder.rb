require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteFolder < BaseMutation
        argument :id, ID, required: true
        argument :force, Boolean, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:, force: nil)
          context[:canvas_api].call("DELETE_FOLDER").proxy(
            "DELETE_FOLDER",
            {
              "id": id,
              "force": force
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end