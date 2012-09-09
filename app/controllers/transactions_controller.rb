class TransactionsController < ApplicationController
  before_filter :authorize

  def index
    if params[:ids]
      render :json => {:transactions => current_user.transactions.where(:id => params[:ids]).all} and return
    end
    render :json => {:transactions => current_user.transactions}
  end

  def create
    transaction = current_user.transactions.build(params[:transaction])
    if transaction.save
      render :json => {:transaction => transaction}
    else
      render :json => {:transaction => transaction}, :status => 422
    end
  end

  def update
    transaction = current_user.transactions.where(:id => params[:id]).first
    if transaction.update_attributes(params[:transaction])
      render :json => {:transaction => transaction}
    else
      render :json => {:transaction => transaction}, :status => 422
    end
  end
end
