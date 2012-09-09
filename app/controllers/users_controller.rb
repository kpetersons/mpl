class UsersController < Clearance::UsersController
  before_filter :authorize

  def show
    render :json => {:user => current_user}
  end



end
