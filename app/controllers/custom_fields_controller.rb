class CustomFieldsController < ApplicationController
    before_action :set_custom_field, only: [:show, :edit, :update, :destroy]
    before_action :set_custom_object
  
    def index
      @custom_fields = @custom_object.custom_fields
    end
  
    def show
    end
  
    def new
      @custom_field = CustomField.new
    end
  
    def create
      @custom_field = @custom_object.custom_fields.build(custom_field_params)
      if @custom_field.save
        redirect_to [@custom_object, @custom_field], notice: 'Custom field was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @custom_field.update(custom_field_params)
        redirect_to [@custom_object, @custom_field], notice: 'Custom field was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @custom_field.destroy
      redirect_to custom_object_custom_fields_url(@custom_object), notice: 'Custom field was successfully destroyed.'
    end
  
    private
  
    def set_custom_field
      @custom_field = CustomField.find(params[:id])
    end
  
    def set_custom_object
      @custom_object = CustomObject.find(params[:custom_object_id])
    end
  
    def custom_field_params
      params.require(:custom_field).permit(:name, :field_type)
    end
  end
  