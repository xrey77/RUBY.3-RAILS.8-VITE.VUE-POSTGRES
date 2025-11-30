require 'jwt'

class Api::LoginController < ActionController::API

        def userLogin

          @user = User.find_by(username: login_params[:username])
          if @user.present?

            if (@user.authenticate(login_params[:password]))

              exp = 8.hours.from_now
              @user_id = @user.id
              payload = { data: @user_id, exp: exp.to_i }
              token = JsonWebToken.encode(payload)

              render json: { 
                id: @user.id,
                username: @user.username,
                firstname: @user.firstname,
                lastname: @user.lastname,
                email: @user.email,
                mobile: @user.mobile,
                roles: @user.roles,
                isactivated: @user.isactivated,
                isblocked: @user.isblocked,
                userpic: @user.userpic,
                qrcodeurl: @user.qrcodeurl,
                token: token,
                message: 'Login Successfull.'
              }, status: :ok     
               
            else
              render json: { 
                message: 'Invalid Password, please try again.'
              }, status: :unprocessable_entity       
  
            end

          else            
            render json: { 
              message: 'Username not found, please register.'
            }, status: :unprocessable_entity     

          end

        end

        private

        def login_params
          params.require(:login).permit(:username, :password)
        end        
end
