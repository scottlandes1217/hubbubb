class CustomObjectsController < ApplicationController
  before_action :set_custom_object, only: [:show, :edit, :update, :destroy]

  def index
    @custom_objects = CustomObject.all
  end

  def show
  end

  def new
    @custom_object = CustomObject.new
  end

  def create
    @custom_object = CustomObject.new(custom_object_params)
    if @custom_object.save
      redirect_to @custom_object, notice: 'Custom object was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @custom_object.update(custom_object_params)
      redirect_to @custom_object, notice: 'Custom object was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @custom_object.destroy
    redirect_to custom_objects_url, notice: 'Custom object was successfully destroyed.'
  end

  private

  def set_custom_object
    @custom_object = CustomObject.find(params[:id])
  end

  def custom_object_params
    params.require(:custom_object).permit(:name, :description)
  end
end