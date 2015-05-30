class BookingsController < ApplicationController

  before_action :load_user, only: :create
  before_action :load_cleaner


  def index
    render
  end

  def create
  end

  def available_slots
    render json: Availability.get_available_slots(params[:frequency], params[:date], params[:duration], @cleaner).map {|slot| slot.strftime("%H:%M:%S")}
  end

  private

  def load_user
    @user = User.first
  end

  def load_cleaner
    @cleaner = Cleaner.first
  end
end