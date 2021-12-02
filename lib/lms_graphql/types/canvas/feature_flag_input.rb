require_relative "../canvas_base_input_type"


module LMSGraphQL
  module Types
    module Canvas
      class CanvasFeatureFlagInput < BaseInputObject
          class FeatureFlagInputContextTypeEnum < ::GraphQL::Schema::Enum
          value "Course"
          value "Account"
          value "User"
        end

                class FeatureFlagInputStateEnum < ::GraphQL::Schema::Enum
          value "off"
          value "allowed"
          value "allowed_on"
          value "on"
        end
        description "Feature Flags. API Docs: https://canvas.instructure.com/doc/api/feature_flags.html"
      argument :context_type, FeatureFlagInputContextTypeEnum, "The type of object to which this flag applies (Account, Course, or User). (This field is not present if this FeatureFlag represents the global Canvas default).Example: Account", required: false
      argument :context_id, ID, "The id of the object to which this flag applies (This field is not present if this FeatureFlag represents the global Canvas default).Example: 1038", required: false
      argument :feature, String, "The feature this flag controls.Example: fancy_wickets", required: false
      argument :state, FeatureFlagInputStateEnum, "The policy for the feature at this context.  can be 'off', 'allowed', 'allowed_on', or 'on'..Example: allowed", required: false
      argument :locked, Boolean, "If set, this feature flag cannot be changed in the caller's context because the flag is set 'off' or 'on' in a higher context.", required: false

      end
    end
  end
end