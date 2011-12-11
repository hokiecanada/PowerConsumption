class LogsController < ApplicationController
  def index
	@log = Log.last
	@log.time = DateTime.now
	@log.save
  end
  
  def create
	outlet = Outlet.find(params[:outlet_id])
	log = outlet.logs.create(params[:log])
	log.time = DateTime.now
    if log.save
		response = { :status =>  @outlet.status }
		render json: response.to_json()
	else
		response = { :status => 1, :time => Time.now }
		render json: response.to_json()
	end
  end

  def destroy
    @outlet = Outlet.find(params[:outlet_id])
	@log = @outlet.logs.find(params[:id])
	@log.destroy
	redirect_to outlet_path(@outlet)
  end
  
end

