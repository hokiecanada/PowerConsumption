class LogsController < ApplicationController
  def index
	@log = Log.last
	@log.time = DateTime.now
	@log.save
  end
  
  def create
	outlet = Outlet.find(params[:outlet_id])
	o1 = Outlet.find(1).status.to_s()
	o2 = Outlet.find(2).status.to_s()
	o3 = Outlet.find(3).status.to_s()
	
	log = outlet.logs.create(params[:log])
	log.time = DateTime.now
    if log.save
		response = { :status =>  (o1 + o2 + o3) }
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

