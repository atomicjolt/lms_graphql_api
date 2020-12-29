require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateCustomColor < BaseMutation
        argument :id, ID, required: true
        argument :asset_string, String, required: true
        argument :hexcode, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(id:, asset_string:, hexcode: nil)
          context[:canvas_api].call("UPDATE_CUSTOM_COLOR").proxy(
            "UPDATE_CUSTOM_COLOR",
            {
              "id": id,
              "asset_string": asset_string
            },
            {
              "hexcode": hexcode
            },
          ).parsed_response
        end
      end
    end
  end
end