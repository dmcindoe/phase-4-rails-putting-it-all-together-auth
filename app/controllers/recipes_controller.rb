class RecipesController < ApplicationController
  def index
    render json: @current_user.recipes, include: :user, status: :created
  end

  def create
    new_recipe = @current_user.recipes.new(recipe_params)
    if new_recipe.save
      render json: new_recipe, include: :user, status: :created
    else
      render json: { errors: new_recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end

end
