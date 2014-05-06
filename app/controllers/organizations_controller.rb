class OrganizationsController < ApplicationController

  def create
    @orgs = []
    params[:orgs].each do |o|
      org = Organization.new
      org.name = o
      org.save
      @orgs << org
    end

    respond_to do |f|
      f.js
    end
  
  end

  def destroy 
    @org = Organization.find(params[:id])
    @org.destroy

    respond_to do |f|
      f.js
    end
  end
end

