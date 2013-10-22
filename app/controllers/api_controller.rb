class ApiController < ApplicationController
  before_action :set_visit, :set_client, only: [:signal]

  def signal
    if @visit
      @client.publish '/visit', {model: @visit.to_json, action:'close'}
    else
      @visit = Visit.new visit_params
      @client.publish '/visit', {model: @visit.to_json, action:'open'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find_by(device_id: params[:device_id])
    end
    def set_client
      @client = Faye::Client.new 'http://localhost:9292/faye'
    end
    # Never trust parameters from the scary internet, only allow the white list through.
  def visit_params
    params.permit(:user_id, :device_id)
  end
end
