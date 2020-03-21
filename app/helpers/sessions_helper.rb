module SessionsHelper
    

    def log_in(user)
        session[:user_id] = user.id
        remember(user)
    end
    
    def current_user 
        
        if  (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            @current_user ||= User.find_by(id: user_id)
            log_in(@current_user)
        end
    end

    def current_user=(user)
        @current_user = user
    end
    
    def logged_in?
        !current_user.nil?
    end
    def remember(user)
        cookies.signed[:user_id] = user.id
        cookies[:remember_token] = user.remember_token
        user.remember
    end
    def log_out(user)
        session.delete(:user_id)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
end
