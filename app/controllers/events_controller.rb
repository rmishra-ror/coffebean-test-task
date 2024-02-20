# frozen_string_literal: true

# controller handle user events
class EventsController < ApplicationController
  EVENT_B = 'Initiate Event B'
  include HTTParty

  before_action :authenticate_user!

  def index

    @events = []
    return if current_user.blank?
    # Need to update below endpoint wiyh iterable.com endpoint and keys
    response = self.class.get("http://run.mocky.io/v3/3a704d48-3127-4848-a420-af8de8bddc1a/#{current_user.email}")
    @events = response['events']
  rescue StandardError
    @error = true
  end

  def new; end

  def create
    case params[:event_type]
    when "A"
      create_event
    when "B"
      create_event_and_send_notificatin
    end
    redirect_to events_path, notice: 'Event has been Created Successfully'
  rescue StandardError
    flash[:error] = 'Something went wrong'
    redirect_to events_path
  end

  def create
    # Need to update below endpoint with iterable.com endpoint and keys
    response = self.class.post("http://run.mocky.io/v3/20dc7b64-9216-4f3f-836d-d2672ebb2daf/api/events/track", body: event_body )
    redirect_to events_path, notice: 'Event has been Initiated Successfully'
  rescue StandardError
    flash[:error] = 'Something went wrong'
    redirect_to events_path
  end

  private
  def create_event
    self.class.post("http://run.mocky.io/v3/20dc7b64-9216-4f3f-836d-d2672ebb2daf/api/events/track", body: event_body )
  end
  
  def push_notification

  end

  def create_event_and_send_notificatin
    create_event
    push_notification
  end

  def event_name
    params[:commit] == EVENT_B ? User::EVENT_TYPE[0] : User::EVENT_TYPE.sample
  end

  def event_body
    {
      email: current_user.email,
      userId: SecureRandom.uuid,
      eventName: event_name,
      id: SecureRandom.uuid,
      dataFields: {},
      campaignId: SecureRandom.uuid,
      templateId: SecureRandom.uuid,
      createNewFields: true
    }
  end
end
