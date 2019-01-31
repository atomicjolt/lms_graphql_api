require_relative "../canvas_base_resolver"

module LMSGraphQL
  module Resolvers
    module Canvas
      class GetSingleAppointmentGroup < CanvasBaseResolver
        type Boolean, null: false
        argument :id, ID, required: true
        argument :include, String, required: false
        def resolve(id:, include: nil, get_all: false)
          result = context[:canvas_api].call("GET_SINGLE_APPOINTMENT_GROUP").proxy(
            "GET_SINGLE_APPOINTMENT_GROUP",
            {
              "id": id,
              "include": include            },
            nil,
            get_all,
          )
          get_all ? result : result.parsed_response
        end
      end
    end
  end
end