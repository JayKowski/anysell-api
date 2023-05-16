class ApplicationController < ActionController::API
    before_action :authorized

    SECRET = Rails.application.secrets.secret_key_base.to_s.freeze

    def encode_token(payload)
        JWT.encode(payload, SECRET)
    end

    def auth_header
        request.headers['Authorization']
    end

    def decode_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, SECRET, true, algorithm: "HS256")
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decode_token
            user_id = decode_token[0]['user_id']
            @user = User.find(user_id)
            return @user
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { success: false, message: "Please login", data: nil }, status: :unauthorized unless logged_in?
    end
end
