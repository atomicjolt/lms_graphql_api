require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasCommunicationChannelInput < BaseInputObject
          class CommunicationChannelTypeEnum < ::GraphQL::Schema::Enum
          value "email"
          value "push"
          value "sms"
          value "twitter"
        end

                class CommunicationChannelWorkflowStateEnum < ::GraphQL::Schema::Enum
          value "unconfirmed"
          value "active"
        end
        description "Communication Channels. API Docs: https://canvas.instructure.com/doc/api/communication_channels.html"
      argument :id, ID, "The ID of the communication channel..Example: 16", required: false
      argument :address, String, "The address, or path, of the communication channel..Example: sheldon@caltech.example.com", required: false
      argument :type, CommunicationChannelTypeEnum, "The type of communcation channel being described. Possible values are: 'email', 'push', 'sms', or 'twitter'. This field determines the type of value seen in 'address'..Example: email", required: false
      argument :position, Int, "The position of this communication channel relative to the user's other channels when they are ordered..Example: 1", required: false
      argument :user_id, ID, "The ID of the user that owns this communication channel..Example: 1", required: false
      argument :workflow_state, CommunicationChannelWorkflowStateEnum, "The current state of the communication channel. Possible values are: 'unconfirmed' or 'active'..Example: active", required: false

      end
    end
  end
end