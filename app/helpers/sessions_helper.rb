module SessionsHelper
    # 전달된 사용자로 로그인
    def log_in(user)
        session[:user_id] = user.id
    end
    
    #현재 로그인한 사용자를 반환(로그인 한 경우에만)
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
    # 로그인 되어있다면 true, 로그아웃이면 false
    def user_signed_in?
        !current_user.nil?
    end
end
