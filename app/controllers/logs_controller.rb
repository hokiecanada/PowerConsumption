class LogsController < ApplicationController
  
  def create
	outlet = Outlet.find(params[:outlet_id])
	o1 = Outlet.find(1).status.to_s()
	o2 = Outlet.find(2).status.to_s()
	o3 = Outlet.find(3).status.to_s()
	
	log = outlet.logs.create(params[:log])
	log.save
	
	#outlet.second = log.watts
	#minute = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.minutes.ago.to_datetime()])
	#outlet.minute = minute.collect{|l| l.watts}.sum / minute.count
	#hour = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.hour.ago.to_datetime()])
	#outlet.hour = hour.collect{|l| l.watts}.sum / hour.count
	#day = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.day.ago.to_datetime()])
	#outlet.day = day.collect{|l| l.watts}.sum / day.count
	#week = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.week.ago.to_datetime()])
	#outlet.week = week.collect{|l| l.watts}.sum / week.count
	#month = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.month.ago.to_datetime()])
	#outlet.month = month.collect{|l| l.watts}.sum / month.count
	#outlet.save
	
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

