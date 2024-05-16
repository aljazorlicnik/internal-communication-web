module Api
    module V1
      class MessagesController < ApplicationController
        protect_from_forgery with: :null_session

        def index
          @messages = Message.order(created_at: :desc)
          render json: @messages.map { |message| message.as_json(include: { file: { methods: :url } }) }
        end

        def update
          @message = Message.find(params[:id])
          @user = User.first
          unless @message.users.include?(@user)
            @message.users << @user
          end
          render json: @message.as_json(include: { file: { methods: :url } })
        end
      end
    end
  end

  