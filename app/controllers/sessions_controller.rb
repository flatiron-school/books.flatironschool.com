class SessionsController < ApplicationController

  def new

  end

  def create
    auth = request.env["omniauth.auth"]
    client = Octokit::Client.new(:access_token => auth[:credentials][:token])
    @orgs = Organization.all
    admitted = false
    @orgs.each do |org|
      if client.org_member?(org.name, client.user.login)
        admitted = true 
        break 
      end
    end
    if admitted
      user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Thanks #{user.nickname}, you logged in!"
    else
      redirect_to '/login', :notice => "it doesn't look like you're a member of flatiron students on github"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
