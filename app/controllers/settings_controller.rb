class SettingsController < ApplicationController

  def index
    render :json => {:settings => current_user.settings}
  end

  def show
    setting = current_user.settings.where(:id => params[:id]).first
    render :json => {:setting => setting}
  end

  def create
    setting = current_user.settings.build(params[:setting])
    if setting.save
      render :json => {:setting => setting}
    else
      render :json => {:setting => setting}, :status => 422
    end
  end

  def update
    setting = current_user.settings.where(:id => params[:id]).first
    if setting.update_attributes(params[:setting])
      render :json => {:setting => setting}
    else
      render :json => {:setting => setting}, :status => 422
    end
  end
end
