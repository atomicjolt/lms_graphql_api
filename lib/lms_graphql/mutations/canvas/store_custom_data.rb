require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class StoreCustomDatum < BaseMutation
        argument :user_id, ID, required: true
        argument :ns, String, required: true
        argument :data, String, required: true
        
        
        field :return_value, Boolean, null: false
        
        def resolve(user_id:, ns:, data:)
          context[:canvas_api].call("STORE_CUSTOM_DATA").proxy(
            "STORE_CUSTOM_DATA",
            {
              "user_id": user_id
            },
            {
              "ns": ns,
              "data": data
            },
          ).parsed_response
        end
      end
    end
  end
end