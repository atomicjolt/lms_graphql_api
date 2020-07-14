require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class ConfirmImageSelection < BaseMutation
        argument :id, ID, required: true
        field :return_value, Boolean, null: false
        def resolve(id:)
          context[:canvas_api].call("CONFIRM_IMAGE_SELECTION").proxy(
            "CONFIRM_IMAGE_SELECTION",
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