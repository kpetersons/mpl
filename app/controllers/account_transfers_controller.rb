class AccountTransfersController < ApplicationController

  before_filter :authorize

  def index
    render :json => {:account_transfers => current_user.account_transfers}
  end

  def show
    render :json => {:account_transfer => current_user.account_transfers.where(:id => params[:id]).first}
  end

  def create
    AccountTransfer.transaction do
      from_account_id = params[:account_transfer][:from_account_id]
      to_account_id = params[:account_transfer][:to_account_id]

      from_account = current_user.accounts.where(:id => from_account_id).first
      to_account = current_user.accounts.where(:id => to_account_id).first

      from_transaction_category = current_user.categories.where(:name => Category::CATEGORY_AT_EXPENSE).first
      unless from_transaction_category
        from_transaction_category = current_user.categories.create(:name => Category::CATEGORY_AT_EXPENSE, :user_type => false, :type => 'expense')
      end
      to_transaction_category = current_user.categories.where(:name => Category::CATEGORY_AT_INCOME).first
      unless to_transaction_category
        to_transaction_category = current_user.categories.create(:name => Category::CATEGORY_AT_INCOME, :user_type => false, :type => 'income')
      end

      amount = params[:account_transfer][:amount]
      transfer_date = params[:account_transfer][:date_when]
      description = params[:account_transfer][:description]

      from_transaction = current_user.transactions.create(
          :account_id => from_account.id,
          :amount => amount,
          :date_when => transfer_date,
          :type => 'expense',
          :category_id => from_transaction_category.id,
          :description => "#{from_account.name} -> #{to_account.name}"
      )
      to_transaction = current_user.transactions.create(
          :account_id => to_account.id,
          :amount => amount,
          :date_when => transfer_date,
          :type => 'income',
          :category_id => to_transaction_category.id,
          :description => "#{from_account.name} -> #{to_account.name}"
      )

      account_transfer = current_user.account_transfers.build(
          :from_transaction_id => from_transaction.id,
          :to_transaction_id => to_transaction.id,
          :description => description,
          :date_when => transfer_date
      )

      if account_transfer.save
        render :json => {:account_transfer => account_transfer}
      else
        render :json => {:account_transfer => account_transfer}, :status => 422
      end
    end
  end

  def update
    account_transfer = current_user.account_transfers.where(:id => params[:id]).first
    if account_transfer.update_attributes(params[:account_transfer])
      render :json => {:account_transfer => account_transfer}
    else
      render :json => {:account_transfer => account_transfer}, :status => 422
    end
  end
end
