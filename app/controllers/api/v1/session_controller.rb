class  Api::V1::SessionController < ApplicationController
      protect_from_forgery with: :null_session

      def create
        puts "Params received: #{params.inspect}"
        user = User.find_by(email: params[:email])
  
      if user
        puts "User found: #{user.inspect}"
      else
        puts "User not found with email: #{params[:email]}"
      end
  
      if user && user.authenticate(params[:password])
        puts "User authenticated: #{user.inspect}"
        render json: { status: 'success', user: user }
      else
        puts "Authentication failed for user: #{user.inspect}"
        render json: { status: 'error', message: 'Invalid email or password' }, status: :unauthorized
      end
      end
    end
