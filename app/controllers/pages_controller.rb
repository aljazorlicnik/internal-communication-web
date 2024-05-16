class PagesController < ApplicationController
    def each
        @message = Message.find(params[:id])
      end
end
