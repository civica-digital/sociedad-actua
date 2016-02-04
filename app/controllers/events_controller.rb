class EventsController < ApplicationController
  before_action :event_params, only: :create
  before_action :authenticate_user!, except: [:show, :index, :calendar, :list]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
 include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def show
  authorize @event
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @event = @organization.events.new
    authorize @event
   
  end
  def edit
    authorize @event
    @organization = Organization.find(params[:organization_id])
  end

  def user_not_authorized
    flash[:alert] = I18n.t('event.pundit.default')
    redirect_to(request.referrer || organization_events_path(@event.organization))
  end

  def create
    @event = Event.new(event_params)
    @event.organization = current_user.profile # TO-DO: Refactor this
    authorize @event

    respond_to do |format|
      if @event.save
        format.html { redirect_to organization_events_path(@event.organization), notice: I18n.t('event.notices.successfully_created') }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @event

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to organization_events_path(@event.organization), notice: I18n.t('event.notices.successfully_updated') }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    skip_authorization
    @organization = Organization.find(params[:organization_id])
  end

  def list
    skip_authorization
    if params[:q]
      @events = Event.multisearch(params[:q])
    else
      @events = Event.all
    end
  end

  def calendar
    skip_authorization

    @calendar = Clndr.new("calendar")
    #@calendar.template = Clndr::Template::FULL
    @calendar.template = Clndr::Template.from_html("#events-calendar-template")

    Event.all.each do |event|
      @calendar.add_event(Time.parse(event.date.to_s), event.name, {
          description: event.description,
          url: organization_event_path(event.organization, event),
          time: event.time.strftime('%H:%M') })
    end
  end
  private
    def set_event
      @event = Event.find(params[:id])
    end

   def event_params
    params.require(:event).permit(:name, :description, :notes, :image,:price, :date,:organization_id,:lat,:time, :lng,:address,:info,causes: [])
  end
end

