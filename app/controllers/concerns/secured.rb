# frozen_string_literal: true

module Secured
    extend ActiveSupport::Concern
    
    included do
        before_action :authenticate_request!
    end

    # SCOPES = {
    #     '/private' => nil,
    #     '/private-scoped'    => ['read:messages']
    #   }
  
    private
  
    def authenticate_request!
      auth_token
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
  
    def http_token
      if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end
  
    def auth_token
      JsonWebToken.verify(http_token)
    end

    # def scope_included
    #     if SCOPES[request.env['PATH_INFO']] == nil
    #       true
    #     else
    #       # The intersection of the scopes included in the given JWT and the ones in the SCOPES hash needed to access
    #       # the PATH_INFO, should contain at least one element
    #       (String(@auth_payload['scope']).split(' ') & (SCOPES[request.env['PATH_INFO']])).any?
    #     end
    #   end
  end