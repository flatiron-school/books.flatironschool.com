class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @organization = Organization.new
    client = Octokit::Client.new(:access_token => current_user.token)
    @current = Organization.all
    @current_names = @current.collect(&:name)
    @orgs = client.orgs(client.user.login).collect(&:login).reject { |o|
      @current_names.include?(o) 
    }
    @type = Type.new
    @incompletes = Type.incomplete
    @admins = User.admins
    @users = User.non_admins
    @tag = Tag.new
  end

  def create
    @users = []
    params[:nickname].each do |n|
      user = User.find(n)
      user.admin = true
      user.save
      @users << user
    end

    respond_to do |f|
      f.js
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.admin = false
    @user.save

    respond_to do |f|
      f.js
    end

  end

end
