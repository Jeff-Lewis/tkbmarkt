class StatementController < ApplicationController
  def index
    @trx = Transaction.where('account_ver=? or account_bel=?', params[:account_id],params[:account_id]).order(trx_date: :desc)
    @trxanz = @trx.count
    @account = Account.find(params[:account_id])
    @customer_id = @account.customer.id
  end
end
