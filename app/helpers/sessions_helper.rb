module SessionsHelper

  def sign_in(user)
    cookies.permanent.signed[:remember_token]=[user.id,user.salt]
    current_user=user
  end

  def current_user=(user)
    @current_user=user
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    session[:return_back] = nil
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_back] || default)
    
  end
  

  private

    def authenticate
      session[:return_back]=request.fullpath
      redirect_to signin_path unless signed_in?
    end

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil,nil]
    end
end
