class MessagesController < ApplicationController
    def show
      @messages = Message.order(created_at: :desc)
    end
  
    def new
      @message = Message.new
    end
  
    def each
        @message = Message.find(params[:id])
      end

      def edit
        @message = Message.find(params[:id])
      end
    
      def update
        @message = Message.find(params[:id])
        if @message.update(message_params)
          redirect_to @message, notice: 'Message was successfully updated.'
        else
          render :edit
        end
      end
    
      def destroy
        @message = Message.find(params[:id])
        @message.destroy
        redirect_to messages_url, notice: 'Message was successfully deleted.'
      end

    def create
      @message = Message.new(message_params)
      if @message.save
        redirect_to message_path(@message), notice: 'Message was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def message_params
        params.require(:message).permit(:title, :content, :file)
    end
  end
  