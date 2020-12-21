require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
        class AuthenticationEventEventTypeEnum < ::GraphQL::Schema::Enum
          value "login"
          value "logout"
        end
      class CanvasAuthenticationEventInput < BaseInputObject
        description "Authentications Log. API Docs: https://canvas.instructure.com/doc/api/authentications_log.html"
      	argument :created_at, LMSGraphQL::Types::DateTimeType, "timestamp of the event.Example: 2012-07-19T15:00:00-06:00", required: false
      	argument :event_type, AuthenticationEventEventTypeEnum, "authentication event type ('login' or 'logout').Example: login", required: false
      	argument :pseudonym_id, ID, "ID of the pseudonym (login) associated with the event.Example: 9478", required: false
      	argument :account_id, ID, "ID of the account associated with the event. will match the account_id in the associated pseudonym..Example: 2319", required: false
      	argument :user_id, ID, "ID of the user associated with the event will match the user_id in the associated pseudonym..Example: 362", required: false

      end
    end
  end
end