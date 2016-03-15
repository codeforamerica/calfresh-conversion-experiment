class UserSubmissionsController < ApplicationController
  def new
    @user_submission ||= UserSubmission.new
    @counties = County.names.sort
  end

  def create
    # TODO — stub below, change
    redirect_to '/apply'
  end
end
