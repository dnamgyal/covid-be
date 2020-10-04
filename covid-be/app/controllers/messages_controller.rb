
require 'twilio-ruby'

class MessagesController < ApplicationController

    def create
        sendMessage(params[:number])
        render json: "success"
    end



    def sendMessage(number)
        account_sid = 'AC83741c4d4a6c3188e021c0f6a4237708'
        auth_token = 'c11cf1e6dfb88abdd2ea2665fa159ee9'
        client = Twilio::REST::Client.new(account_sid, auth_token)

        from = '+12184380831' # Your Twilio number
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