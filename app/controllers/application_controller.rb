class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :set_cart
    helper_method :current_cart

  
    helper_method :current_user, :current_user_id, :logged_in?, :authenticate_admin
  
    def current_user
      return nil unless session[:session_token]
      @current_user ||= User.find_by(session_token: session[:session_token])
    end
  
    def current_user_id
      current_user ? current_user.id : nil
    end
  
    def logged_in?
      !!current_user
    end
  
    def login_user!(user)
      session[:session_token] = user.reset_session_token!
    end
  
    def require_user!
      redirect_to new_session_url if current_user.nil?
    end

    def authenticate_admin
      return unless !current_user.admin?
      flash[:error] = "Admin access only"
      redirect_to root_url
    end

    private

    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue 
      ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

    def current_cart
      if !session[:cart_id].nil?
        Cart.find(session[:cart_id])
      end
    end

  end
  