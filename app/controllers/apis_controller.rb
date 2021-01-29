class ApisController < InheritedResources::Base

  def mailer
    @user1 = User.first

    @content_hash = {"personalizations": [
        {
          "to": [
            {
              "email": @user1.email,
              "name": "a"
            }
          ],
          "dynamic_template_data": {
            "verb": "",
            "adjective": "",
            "noun": "",
            "currentDayofWeek": ""
          },
          "subject": "Hello, World!"
        }
    
      ],
      "from": {
        "email": "noreply@johndoe.com",
        "name": "John Doe"
      },
      "reply_to": {
        "email": "noreply@johndoe.com",
        "name": "John Doe"
      },
      "template_id": "<<YOUR_TEMPLATE_ID>>"
    }





   
    render :json => @content_hash

  end

  private

    def api_params
      params.require(:api).permit()
    end

end
