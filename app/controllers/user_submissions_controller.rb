class UserSubmissionsController < ApplicationController
  def new
    @user_submission ||= UserSubmission.new
    @counties = County.names.sort
  end

  def create
    @user_submission = UserSubmission.new(user_submission_params)

    if @user_submission.valid?
      # TODO — stub below, change
      redirect_to '/apply'
    else
      @counties = County.names.sort
      render 'new'
    end
  end

  private
  def user_submission_params
    params.require(:user_submission).permit(:phone_number, :email_address, :county)
  end
end
