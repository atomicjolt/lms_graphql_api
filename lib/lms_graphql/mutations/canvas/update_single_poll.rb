require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class UpdateSinglePoll < BaseMutation
        argument :id, ID, required: true
        argument :polls_question, String, required: true
        argument :polls_description, String, required: false
        field :return_value, Boolean, null: false
        def resolve(id:, polls_question:, polls_description: nil)
          context[:canvas_api].call("UPDATE_SINGLE_POLL").proxy(
            "UPDATE_SINGLE_POLL",
            {
              "id": id
            },
            {
              "polls[question]": polls_question,
              "polls[description]": polls_description
            },
          ).parsed_response
        end
      end
    end
  end
end