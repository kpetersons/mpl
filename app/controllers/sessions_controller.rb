class SessionsController < Clearance::SessionsController

  def destroy
    sign_out
    render :json => {:url => "#{request.protocol}#{request.host_with_port}/"}
  end

end
