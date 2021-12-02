require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class ModerateAllEportfoliosForUser < BaseMutation
        argument :user_id, ID, required: true
        argument :spam_status, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(user_id:, spam_status: nil)
          context[:canvas_api].call("MODERATE_ALL_EPORTFOLIOS_FOR_USER").proxy(
            "MODERATE_ALL_EPORTFOLIOS_FOR_USER",
            {
              "user_id": user_id
            },
            {
              "spam_status": spam_status
            },
          ).parsed_response
        end
      end
    end
  end
end