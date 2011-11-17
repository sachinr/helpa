class Organization::OrganizationsController < ApplicationController
  before_filter :authenticate_organization!

  def edit
    @organization = current_organization
  end

end

