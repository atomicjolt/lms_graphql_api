require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class TerminateAllUserSession < BaseMutation
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:)
          context[:canvas_api].call("TERMINATE_ALL_USER_SESSIONS").proxy(
            "TERMINATE_ALL_USER_SESSIONS",
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