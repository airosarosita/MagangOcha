# app/controllers/client/statics_controller.rb
class Client::StaticsController < ApplicationController
    def index
      Rails.logger.debug "Client::StaticsController#index is being called"
    end
  
    def contact
      Rails.logger.debug "Client::StaticsController#contact is being called"
    end
  end
  