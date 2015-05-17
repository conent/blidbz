class PagesController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter :verify_authenticity_token, :only => [:test]
  def home
  end

  def test 
  	@string = "not set"
  	if params != nil

      @user = User.new

  		@user.name = params[:userName]
  		@user.surname =params[:userSurname]
  		@user.email = params[:userEmail]
  		@user.password = params[:userPassword]
  		@user.cellphone = params[:userCellphone]
  		@user.regID = params[:userID]


 			if @user.save
 				# do something when save is successful
 			else
 				# handle the case when it doesn't save properly
 			end
      require 'gcm'
			gcm = GCM.new("AIzaSyD4dJdWOBUVjDStIpNUI-KOq_1Vqrsa1-E")
			# you can set option parameters in here
			#  - all options are pass to HTTParty method arguments
			#  - ref: https://github.com/jnunemaker/httparty/blob/master/lib/httparty.rb#L40-L68
			#  gcm = GCM.new("my_api_key", timeout: 3)
			registration_ids= ["12", "13"] # an array of one or more client registration IDs
			options = {data: "registration successful"}
			response = gcm.send(registration_ids, options)

      @string = params[:userID] 
      #provare a commentare la linea sotto
      #render :json =>{:data => @string}
      puts response {render :layout => false}
    end
	end
end
