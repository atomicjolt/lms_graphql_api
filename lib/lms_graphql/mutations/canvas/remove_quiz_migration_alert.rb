require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class RemoveQuizMigrationAlert < BaseMutation
        argument :id, ID, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:)
          context[:canvas_api].call("REMOVE_QUIZ_MIGRATION_ALERT").proxy(
            "REMOVE_QUIZ_MIGRATION_ALERT",
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