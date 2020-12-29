require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class DeleteConcludeCourse < BaseMutation
        argument :id, ID, required: true
        argument :event, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:, event:)
          context[:canvas_api].call("DELETE_CONCLUDE_COURSE").proxy(
            "DELETE_CONCLUDE_COURSE",
            {
              "id": id,
              "event": event
            },
            {},
          ).parsed_response
        end
      end
    end
  end
end