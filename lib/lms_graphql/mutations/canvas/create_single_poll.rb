require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateSinglePoll < BaseMutation
        argument :polls_question, String, required: true
        argument :polls_description, String, required: false
        field :return_value, Boolean, null: false
        def resolve(polls_question:, polls_description: nil)
          context[:canvas_api].call("CREATE_SINGLE_POLL").proxy(
            "CREATE_SINGLE_POLL",
            {},
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