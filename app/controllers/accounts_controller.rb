class AccountsController < ApplicationController

  before_filter :authorize

  def index
    render :json => {:accounts => current_user.accounts}
  end

  def show
    render :json => {:account => current_user.accounts.where(:id => params[:id]).first}
  end

  def create
    account = current_user.accounts.build(params[:account])
    if account.save
      render :json => {:account => account}
    else
      render :json => {:account => account}, :status => 422
    end
  end

  def update
    account = current_user.accounts.where(:id => params[:id]).first
    if account.update_attributes(params[:account])
      render :json => {:account => account}
    else
      render :json => {:account => account}, :status => 422
    end
  end

end
