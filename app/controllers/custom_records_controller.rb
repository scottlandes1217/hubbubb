class CustomRecordsController < ApplicationController
    before_action :set_custom_object
  
    def index
      @custom_records = @custom_object.custom_records
    end
  
    def new
      @custom_record = CustomRecord.new
    end
  
    def create
      @custom_record = @custom_object.custom_records.build(custom_record_params)
      if @custom_record.save
        redirect_to custom_object_custom_records_path(@custom_object), notice: 'Custom record was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def set_custom_object
      @custom_object = CustomObject.find(params[:custom_object_id])
    end
  
    def custom_record_params
      params.require(:custom_record).permit(data: {})
    end
  end
  