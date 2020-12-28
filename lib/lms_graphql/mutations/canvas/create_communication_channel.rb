require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/communication_channel"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateCommunicationChannel < BaseMutation
        argument :user_id, ID, required: true
        argument :communication_channel_address, String, required: true
        argument :communication_channel_type, String, required: true
        argument :communication_channel_token, String, required: false
        argument :skip_confirmation, Boolean, required: false
        
        
        field :communication_channel, LMSGraphQL::Types::Canvas::CanvasCommunicationChannel, null: false
        
        def resolve(user_id:, communication_channel_address:, communication_channel_type:, communication_channel_token: nil, skip_confirmation: nil)
          context[:canvas_api].call("CREATE_COMMUNICATION_CHANNEL").proxy(
            "CREATE_COMMUNICATION_CHANNEL",
            {
              "user_id": user_id
            },
            {
              "communication_channel[address]": communication_channel_address,
              "communication_channel[type]": communication_channel_type,
              "communication_channel[token]": communication_channel_token,
              "skip_confirmation": skip_confirmation
            },
          ).parsed_response
        end
      end
    end
  end
end