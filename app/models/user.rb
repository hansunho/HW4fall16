class User < ActiveRecord::Base
    
    def self.create_user! (user_params)
        @user = User.new(user_params)
        if(User.exists?(user_id: @user.user_id)) then return nil
        else  @user.save! 
            return @user
        end
    end
    
end
