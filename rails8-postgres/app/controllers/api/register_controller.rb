
class Api::RegisterController < ActionController::API

        def userRegistration
            # json_body = request.body.read
            # jdata = JSON.parse(json_body)

            @user = User.new(register_params)
            if @user.save            
                render json: { 
                    message: 'You have successfully registered, please login now.'
                }, status: :created      
            else
                render json: { message: @user.errors.full_messages[0] }, status: :unprocessable_entity
            end
        end

        private

        def register_params
          params.require(:register).permit(
            :firstname, :lastname, :email, :mobile,
            :username, :password)
        end        


end
