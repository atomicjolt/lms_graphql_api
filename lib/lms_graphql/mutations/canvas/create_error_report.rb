require_relative "../canvas_base_mutation"

module LMSGraphQL
  module Mutations
    module Canvas
      class CreateErrorReport < BaseMutation
        argument :error_subject, String, required: true
        argument :error_url, String, required: false
        argument :error_email, String, required: false
        argument :error_comments, String, required: false
        argument :error_http_env, String, required: false
        
        
        field :return_value, Boolean, null: false
        
        def resolve(error_subject:, error_url: nil, error_email: nil, error_comments: nil, error_http_env: nil)
          context[:canvas_api].call("CREATE_ERROR_REPORT").proxy(
            "CREATE_ERROR_REPORT",
            {},
            {
              "error[subject]": error_subject,
              "error[url]": error_url,
              "error[email]": error_email,
              "error[comments]": error_comments,
              "error[http_env]": error_http_env
            },
          ).parsed_response
        end
      end
    end
  end
end