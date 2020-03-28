class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = 'Create category successfully'
      redirect_to root_path
    else
      flash[:alert] = 'Create category failed'
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id]).destroy
    redirect_to admin_categories_url
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    if @category.update_attributes(category_params)
      flash[:notice] = 'Successfully updated category.'
      redirect_to admin_categories_url
    else
      render 'edit'
    end
  end


  private

  def category_params
    params.require(:category).permit :name
  end
end
