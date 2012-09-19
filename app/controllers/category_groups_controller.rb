class CategoryGroupsController < ApplicationController

  before_filter :authorize

  def index
    render :json => {:category_groups => current_user.category_groups}
  end

  def show
    render :json => {:category_group => current_user.category_groups.where(:id => params[:id]).first}
  end

  def create
    category_group = current_user.category_groups.where(:name => params[:category_group][:name]).first
    if category_group.nil?
      category_group = current_user.category_groups.build(params[:category_group])
    end
    if category_group.save
      params[:category_group][:category_ids].each do |category_id|
        current_user.categories.where(:id => category_id).first.update_attribute(:category_group_id, category_group.id)
      end
      render :json => {:category_group => category_group}
    else
      render :json => {:category_group => category_group}, :status => 422
    end
  end

  def update
    category_group = current_user.category_groups.where(:id => params[:id]).first
    if category_group.update_attributes(params[:category_group])
      render :json => {:category_group => category_group}
    else
      render :json => {:category_group => category_group}, :status => 422
    end
  end
  
end
