module Api
    module V1
      class MessagesController < ApplicationController
        def index
          @messages = Message.order(created_at: :desc)
          render json: @messages.map { |message| message.as_json(include: { file: { methods: :url } }) }
        end
      end
    end
  end