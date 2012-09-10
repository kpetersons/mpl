class CategoriesController < ApplicationController

  before_filter :authorize

  def index
    render :json => {:categories => current_user.categories}
  end

  def show
    render :json => {:category => current_user.categories.where(:id => params[:id]).first}
  end

  def create
    category = current_user.categories.build(params[:category])
    if category.save
      render :json => {:category => category}
    else
      render :json => {:category => category}, :status => 422
    end
  end

  def update
    category = current_user.categories.where(:id => params[:id]).first
    if category.update_attributes(params[:category])
      render :json => {:category => category}
    else
      render :json => {:category => category}, :status => 422
    end
  end  
end
