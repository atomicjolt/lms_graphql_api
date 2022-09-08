require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/report"
module LMSGraphQL
  module Mutations
    module Canvas
      class StartReport < BaseMutation
        argument :account_id, ID, required: true
        argument :report, String, required: true
        argument :parameters, String, required: false
        argument :parameters_skip_message, Boolean, required: false
        argument :parameters_course_id, Int, required: false
        argument :parameters_users, Boolean, required: false
        
        
        field :report, LMSGraphQL::Types::Canvas::CanvasReport, null: false
        
        def resolve(account_id:, report:, parameters: nil, parameters_skip_message: nil, parameters_course_id: nil, parameters_users: nil)
          context[:canvas_api].call("START_REPORT").proxy(
            "START_REPORT",
            {
              "account_id": account_id,
              "report": report
            },
            {
              "parameters": parameters,
              "parameters[skip_message]": parameters_skip_message,
              "parameters[course_id]": parameters_course_id,
              "parameters[users]": parameters_users
            },
          ).parsed_response
        end
      end
    end
  end
end