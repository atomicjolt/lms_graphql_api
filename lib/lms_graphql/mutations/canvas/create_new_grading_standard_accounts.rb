require_relative "../canvas_base_mutation"
require_relative "../../types/canvas/grading_standard"
module LMSGraphQL
  module Mutations
    module Canvas
      class CreateNewGradingStandardAccount < BaseMutation
        argument :account_id, ID, required: true
        argument :title, String, required: true
        argument :grading_scheme_entry_name, [String], required: true
        argument :grading_scheme_entry_value, [Int], required: true
        
        
        field :grading_standard, LMSGraphQL::Types::Canvas::CanvasGradingStandard, null: false
        
        def resolve(account_id:, title:, grading_scheme_entry_name:, grading_scheme_entry_value:)
          context[:canvas_api].call("CREATE_NEW_GRADING_STANDARD_ACCOUNTS").proxy(
            "CREATE_NEW_GRADING_STANDARD_ACCOUNTS",
            {
              "account_id": account_id
            },
            {
              "title": title,
              "grading_scheme_entry[name]": grading_scheme_entry_name,
              "grading_scheme_entry[value]": grading_scheme_entry_value
            },
          ).parsed_response
        end
      end
    end
  end
end