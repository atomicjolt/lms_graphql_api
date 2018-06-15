require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class StartKalturaSession < BaseMutation

        field :return_value, Boolean, null: false
        def resolve()
          context[:canvas_api].call("START_KALTURA_SESSION").proxy(
            "START_KALTURA_SESSION",
            {
            },
            nil,
          ).parsed_response
        end
      end
    end
  end
end