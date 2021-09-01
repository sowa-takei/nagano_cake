class Public::RegistrationsController < ApplicationController
  def new
   @registration = Registration.new
  end
  
end

