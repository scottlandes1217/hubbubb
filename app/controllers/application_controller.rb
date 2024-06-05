class ApplicationController < ActionController::Base
    before_action :set_custom_objects
  
    private
  
    def set_custom_objects
      @custom_objects = CustomObject.all
    end
  end
  