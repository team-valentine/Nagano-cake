class AdminsController < ApplicationController
    layout "admin"
  
    protected

    def not_authenticated
      redirect_to ""
    end
end