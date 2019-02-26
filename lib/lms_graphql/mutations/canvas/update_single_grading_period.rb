require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateSingleGradingPeriod < BaseMutation
        argument :course_id, ID, required: true
        argument :id, ID, required: true
        argument :grading_periods_start_date, [LMSGraphQL::Types::DateTimeType], required: true
        argument :grading_periods_end_date, [LMSGraphQL::Types::DateTimeType], required: true
        argument :grading_periods_weight, Float, required: false
        field :return_value, Boolean, null: false
        def resolve(course_id:, id:, grading_periods_start_date:, grading_periods_end_date:, grading_periods_weight: nil)
          context[:canvas_api].call("UPDATE_SINGLE_GRADING_PERIOD").proxy(
            "UPDATE_SINGLE_GRADING_PERIOD",
            {
              "course_id": course_id,
              "id": id
            },
            {
              "grading_periods[start_date]": grading_periods_start_date,
              "grading_periods[end_date]": grading_periods_end_date,
              "grading_periods[weight]": grading_periods_weight
            },
          ).parsed_response
        end
      end
    end
  end
end