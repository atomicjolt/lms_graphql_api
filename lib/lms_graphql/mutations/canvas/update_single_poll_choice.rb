require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateSinglePollChoice < BaseMutation
        argument :poll_id, ID, required: true
        argument :id, ID, required: true
        argument :poll_choices_text, [String], required: true
        argument :poll_choices_is_correct, [Boolean], required: false
        argument :poll_choices_position, [Int], required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(poll_id:, id:, poll_choices_text:, poll_choices_is_correct: nil, poll_choices_position: nil)
          context[:canvas_api].call("UPDATE_SINGLE_POLL_CHOICE").proxy(
            "UPDATE_SINGLE_POLL_CHOICE",
            {
              "poll_id": poll_id,
              "id": id
            },
            {
              "poll_choices[text]": poll_choices_text,
              "poll_choices[is_correct]": poll_choices_is_correct,
              "poll_choices[position]": poll_choices_position
            },
          ).parsed_response
        end
      end
    end
  end
end