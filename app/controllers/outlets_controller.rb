class OutletsController < ApplicationController
  # GET /outlets
  # GET /outlets.json
  def index
	@outlet1 = Outlet.find(1)
	#count = @outlet1.logs.last.id
	#@logs1 = @outlet1.logs.find(:all,:conditions => ['id > ?', count-31])
	@logs1 = @outlet1.logs.collect{|l| l.watts}
	data1()
	
	@outlet2 = Outlet.find(2)
	#count = @outlet2.logs.last.id
	#@logs2 = @outlet2.logs.find(:all,:conditions => ['id > ?', count-31])
	@logs2 = @outlet2.logs.collect{|l| l.watts}
	data2()
	
	@outlet3 = Outlet.find(3)
	#count = @outlet3.logs.last.id
	#@logs3 = @outlet3.logs.find(:all,:conditions => ['id > ?', count-31])
	@logs3 = @outlet3.logs.collect{|l| l.watts}
	data3()
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outlets }
    end
  end
 

  def graph
	outlet = Outlet.find(params[:id])
	#count = outlet.logs.last.id
	#logs = outlet.logs.find(:all, :conditions => ['id > ?', count-31])
    logs = outlet.logs
	
	respond_to do |format|
      format.json { render json: logs.collect{|l| l.watts} }
    end
  end
  
  
  def graph1
	outlet = Outlet.find(1)
	#count = outlet.logs.last.id
	#logs = outlet.logs.find(:all, :conditions => ['id > ?', count-31])
    logs = outlet.logs
	
	respond_to do |format|
      format.json { render json: logs.collect{|l| l.watts} }
    end
  end


  def graph2
	outlet = Outlet.find(2)
	#count = outlet.logs.last.id
	#logs = outlet.logs.find(:all, :conditions => ['id > ?', count-31])
    logs = outlet.logs
	
	respond_to do |format|
      format.json { render json: logs.collect{|l| l.watts} }
    end
  end

  
  def graph3
	outlet = Outlet.find(3)
	#count = outlet.logs.last.id
	#logs = outlet.logs.find(:all, :conditions => ['id > ?', count-31])
    logs = outlet.logs
	
	respond_to do |format|
      format.json { render json: logs.collect{|l| l.watts} }
    end
  end

  
  
    def detail1
	outlet = Outlet.find(1)
	#count = outlet.logs.last.id
	#logs = outlet.logs.find(:all, :conditions => ['id > ?', count-101])
    render json: Outlet.find(1).logs.collect{|l| l.watts}
  end


  def detail2
	#outlet = Outlet.find(2)
	#count = outlet.logs.last.id
	#logs = outlet.logs.find(:all, :conditions => ['id > ?', count-101])
	render json: Outlet.find(2).logs.collect{|l| l.watts}
  end

  
  def detail3
	#outlet = Outlet.find(3)
	#count = outlet.logs.last.id
	#logs = outlet.logs.find(:all, :conditions => ['id > ?', count-101])
	render json: Outlet.find(3).logs.collect{|l| l.watts}
  end
  
  def detail
	render json: Outlet.find(params[:id]).logs.collect{|l| l.watts}
  end
  
  # GET /outlets/1
  # GET /outlets/1.json
  def show
    @outlet = Outlet.find(params[:id])
	#count = @outlet.logs.last.id
	#@logs = @outlet.logs.find(:all,:conditions => ['id > ?', count-31])
	#@time = DateTime.now
	@logs = @outlet.logs.collect{|l| l.watts}
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outlet }
    end
  end

  
  def power_off
	@outlet = Outlet.find(params[:id])
	@outlet.status = 0
	@outlet.save
	redirect_to outlet_path(@outlet)
  end
  
  
  def power_on
	@outlet = Outlet.find(params[:id])
	@outlet.status = 1
	@outlet.save
	redirect_to outlet_path(@outlet)
  end
  
  
  # GET /outlets/new
  # GET /outlets/new.json
  def new
    @outlet = Outlet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outlet }
    end
  end

  # GET /outlets/1/edit
  def edit
    @outlet = Outlet.find(params[:id])
  end

  # POST /outlets
  # POST /outlets.json
  def create
    @outlet = Outlet.new(params[:outlet])

    respond_to do |format|
      if @outlet.save
        format.html { redirect_to @outlet, notice: 'Outlet was successfully created.' }
        format.json { render json: @outlet, status: :created, location: @outlet }
      else
        format.html { render action: "new" }
        format.json { render json: @outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /outlets/1
  # PUT /outlets/1.json
  def update
    @outlet = Outlet.find(params[:id])

    respond_to do |format|
      if @outlet.update_attributes(params[:outlet])
        format.html { redirect_to @outlet, notice: 'Outlet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @outlet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outlets/1
  # DELETE /outlets/1.json
  def destroy
    @outlet = Outlet.find(params[:id])
    @outlet.destroy

    respond_to do |format|
      format.html { redirect_to outlets_url }
      format.json { head :ok }
    end
  end
  
  
  private
  def data1
	outlet = Outlet.find(1)
  	
	#minute = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.minutes.ago.to_datetime()])
	#outlet.minute = minute.collect{|l| l.watts}.sum / minute.count
	
	#hour = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.hour.ago.to_datetime()])
	#outlet.hour = hour.collect{|l| l.watts}.sum / hour.count
	
	day = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.day.ago.to_datetime()])
	if !day.nil?
		outlet.day = day.collect{|l| l.watts}.sum
	else
		outlet.day = 0
	end
		
	week = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.week.ago.to_datetime()])
	if !week.nil?
		outlet.week = week.collect{|l| l.watts}.sum
	else
		outlet.week = 0
	end
	
	month = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.month.ago.to_datetime()])
	if !month.nil?
		outlet.month = month.collect{|l| l.watts}.sum
	else
		outlet.month = 0
	end
	
	outlet.save
  end
  
  
  def data2
	outlet = Outlet.find(2)
	
	#minute = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.minutes.ago.to_datetime()])
	#outlet.minute = minute.collect{|l| l.watts}.sum / minute.count
	
	#hour = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.hour.ago.to_datetime()])
	#outlet.hour = hour.collect{|l| l.watts}.sum / hour.count
	
	day = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.day.ago.to_datetime()])
	if day.count > 0
		outlet.day = day.collect{|l| l.watts}.sum
	else
		outlet.day = 0
	end
		
	week = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.week.ago.to_datetime()])
	if week.count > 0
		outlet.week = week.collect{|l| l.watts}.sum
	else
		outlet.week = 0
	end
	
	month = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.month.ago.to_datetime()])
	if month.count > 0
		outlet.month = month.collect{|l| l.watts}.sum
	else
		outlet.month = 0
	end
	
	outlet.save
  end
  
  
  def data3
	outlet = Outlet.find(3)
	
	#minute = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.minutes.ago.to_datetime()])
	#outlet.minute = minute.collect{|l| l.watts}.sum / minute.count
	
	#hour = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.hour.ago.to_datetime()])
	#outlet.hour = hour.collect{|l| l.watts}.sum / hour.count
	
	day = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.day.ago.to_datetime()])
	if day.count > 0
		outlet.day = day.collect{|l| l.watts}.sum
	else
		outlet.day = 0
	end
		
	week = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.week.ago.to_datetime()])
	if week.count > 0
		outlet.week = week.collect{|l| l.watts}.sum
	else
		outlet.week = 0
	end
	
	month = outlet.logs.find(:all, :conditions => ["created_at > ?", 1.month.ago.to_datetime()])
	if month.count > 0
		outlet.month = month.collect{|l| l.watts}.sum
	else
		outlet.month = 0
	end
	
	outlet.save
  end
end
