class SessionsController < ApplicationController
  include CurrentUserConcern

  def create
    @user = User
      .find_by(email: params['user']['email'])
      .try(:authenticate, params['user']['password'])

    if @user
      session[:user_id] = @user.id
      render json: {
        status: :created,
        logged_in: true,
        user: @user
      }
    else
      @current_user = nil # this is to prevent the user from being logged in
      reset_session # this is to prevent the user from being logged in
      render json: { status: 401 }
    end
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      reset_session
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    @current_user = nil # this is to prevent the user from being logged in
    reset_session
    # cookies.delete :user_id
    render json: {
      status: 200,
      logged_out: true
    }
  end
end
