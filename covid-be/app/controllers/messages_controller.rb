require 'dotenv/rails-now'
require 'twilio-ruby'

class MessagesController < ApplicationController

    def create
        sendMessage(params[:number])
        render json: "success"
    end



    def sendMessage(number)
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = ENV['TWILIO_NUMBER'] # Your Twilio number
        to = '+1' + number # Your mobile phone number

        client.messages.create(
        from: from,
        to: to,
        body: "Hey friend!"
        )
    end

    private

    def phone_params
        params.permit(:number)
    end

end