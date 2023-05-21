class V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:login, :create]

    def index
    end

    def login
        @user = User.find_by(email_address: params[:email_address])
        if @user && @user.authenticate(params[:password])
            @token = encode_token({user_id: @user.id})
            render json: {
                success: true,
                message: "login successful!",
                data: {
                    token: @token,
                    user: UserSerializer.new(@user)
                }
            }, status: :ok
        else
            render json: {
                success: false,
                message: "user not found",
                data: nil
            }, status: :not_found
        end
    end

    def create
        @user = User.create!(new_user_params)
        if @user
            @token = encode_token({user_id: @user.id})
            render json: {
                success: true,
                message: "user created successfully!",
                data: {
                    token: @token,
                    user: UserSerializer.new(@user)
                }
            }, status: :ok
        else
            render json: {
                success: false,
                message: "user not created",
                data: nil
            }, status: @user.errors.status
        end
    end

    def update
        if @user.update!(new_user_params)
            render json: {
                success: true,
                message: "user details changed successfully!",
                data: {
                    user: UserSerializer.new(@user)
                }
            }, status: :ok
        else
            render json: {
                success: false,
                message: "user not updated",
                data: nil
            }, status: @user.errors.status
        end
    end


    private

    def new_user_params
        params.require(:user).permit(:username, :password, :location, :user_type, :mobile_number, :email_address, :about)
    end
end
