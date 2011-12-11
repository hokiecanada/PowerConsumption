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
	log.save
	
	outlet.second = log.watts
	minute = outlet.logs.where(:all, :conditions => ["time > ?", 1.minutes.ago])
	outlet.minute = minute.sum("watts") / minute.count
	outlet.save
	
	response = o1 + o2 + o3
	render json: response.to_json()
  end

  def destroy
    @outlet = Outlet.find(params[:outlet_id])
	@log = @outlet.logs.find(params[:id])
	@log.destroy
	redirect_to outlet_path(@outlet)
  end
  
end

