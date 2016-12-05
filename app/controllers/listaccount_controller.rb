class ListaccountController < ApplicationController
  def index
    @user = User.find(params[:user_id]) if params[:user_id]
    @user_id_ver = params[:user_id_ver]
    @company_id_ver = params[:company_id_ver]
    @ref = params[:ref]
    @object_name = params[:object_name]
    @object_id = params[:object_id]
    @amount = params[:amount]
    if params[:topic]
      @topic = params[:topic]
    else
      @topic = "Accountuser"
    end
  end
end
