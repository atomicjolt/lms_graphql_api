require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasDeveloperKeyInput < BaseInputObject
        description "Public JWK. API Docs: https://canvas.instructure.com/doc/api/public_jwk.html"
        argument :id, ID, "The ID should match the Developer Key ID in canvas.Example: 1000000000040", required: false
        argument :is_lti_key, Boolean, "true the tool is a lti key, null is not a lti key.Example: true", required: false
        argument :visible, Boolean, "Controls if the tool is visable.Example: true", required: false
        argument :account_name, String, "The name of the account associated with the tool.Example: The Academy", required: false
        argument :public_jwk, String, "The public key in jwk format.Example: { 	'kty':'RSA', 	'e':'AQAB', 	'n':'ufmgt156hs168mgdhy168jrsydt168ju816rtahesuvdbmnrtd87t7h8ser', 	'alg':'RS256', 	'use':'sig', 	'kid':'Se68gr16s6tj_87sdr98g489dsfjy-547a6eht1', }", required: false
        argument :vendor_code, String, "The code of the vendor managing the tool.Example: fi5689s9avewr68", required: false
        argument :last_used_at, LMSGraphQL::Types::DateTimeType, "The date and time the tool was last used.Example: 2019-06-07T20:34:33Z", required: false
        argument :access_token_count, Float, "The number of active access tokens associated with the tool.Example: 0", required: false
        argument :redirect_uris, String, "redirect uris description.Example: https://redirect.to.here.com", required: false
        argument :redirect_uri, String, "redirect uri description.Example: https://redirect.to.here.com", required: false
        argument :api_key, String, "Api key for api access for the tool.Example: sd45fg648sr546tgh15S15df5se56r4xdf45asef456", required: false
        argument :notes, String, "Notes for use specifications for the tool.Example: Used for sorting graded assignments", required: false
        argument :name, String, "Display name of the tool.Example: Tool 1", required: false
        argument :user_id, ID, "ID of the user associated with the tool.Example: tu816dnrs6zdsg148918dmu", required: false
        argument :created_at, LMSGraphQL::Types::DateTimeType, "The time the jwk was created.Example: 2019-06-07T20:34:33Z", required: false
        argument :user_name, String, "The user name of the tool creator.Example: johnsmith", required: false
        argument :email, String, "Email associated with the tool owner.Example: johnsmith@instructure.com", required: false
        argument :require_scopes, Boolean, "True if the tool has required permissions, null if there are no needed permissions.Example: true", required: false
        argument :icon_url, String, "Icon to be displayed with the name of the tool.Example: null", required: false
        argument :scopes, String, "Specified permissions for the tool.Example: https://canvas.instructure.com/lti/public_jwk/scope/update", required: false
        argument :workflow_state, String, "The current state of the tool.Example: active", required: false

      end
    end
  end
end