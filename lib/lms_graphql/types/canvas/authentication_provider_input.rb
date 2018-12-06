require_relative "../canvas_base_input_type"
require_relative "federated_attributes_config"

module LMSGraphQL
  module Types
    module Canvas
      class CanvasAuthenticationProviderInput < BaseInputObject
        description "Authentication Providers. API Docs: https://canvas.instructure.com/doc/api/authentication_providers.html"
        argument :identifier_format, String, "Valid for SAML providers..Example: urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress", required: false
        argument :auth_type, String, "Valid for all providers..Example: saml", required: false
        argument :id, ID, "Valid for all providers..Example: 1649", required: false
        argument :log_out_url, String, "Valid for SAML providers..Example: http://example.com/saml1/slo", required: false
        argument :log_in_url, String, "Valid for SAML and CAS providers..Example: http://example.com/saml1/sli", required: false
        argument :certificate_fingerprint, String, "Valid for SAML providers..Example: 111222", required: false
        argument :requested_authn_context, String, "Valid for SAML providers..", required: false
        argument :auth_host, String, "Valid for LDAP providers..Example: 127.0.0.1", required: false
        argument :auth_filter, String, "Valid for LDAP providers..Example: filter1", required: false
        argument :auth_over_tls, Int, "Valid for LDAP providers..", required: false
        argument :auth_base, String, "Valid for LDAP and CAS providers..", required: false
        argument :auth_username, String, "Valid for LDAP providers..Example: username1", required: false
        argument :auth_port, Int, "Valid for LDAP providers..", required: false
        argument :position, Int, "Valid for all providers..Example: 1", required: false
        argument :idp_entity_id, ID, "Valid for SAML providers..Example: http://example.com/saml1", required: false
        argument :login_attribute, String, "Valid for SAML providers..Example: nameid", required: false
        argument :sig_alg, String, "Valid for SAML providers..Example: http://www.w3.org/2001/04/xmldsig-more#rsa-sha256", required: false
        argument :jit_provisioning, Boolean, "Just In Time provisioning. Valid for all providers except Canvas (which has the similar in concept self_registration setting)..", required: false
        argument :federated_attributes, LMSGraphQL::Types::Canvas::CanvasFederatedAttributesConfigInput, "", required: false

      end
    end
  end
end