class AuthenticationController < ApplicationController
def new
  @user = User.new
end

def create
  @user = User.new(params[:user])
  if @user.save
    redirect_to root_url, :notice => "Signed up!"
  else
     render template: "authentication/signup"
  end
end

def new1
end

def authenticate
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "authentication/login"
  end
end

def logout
  session[:user_id] = nil
  redirect_to root_url, :notice => "Logged out!"
end

end
