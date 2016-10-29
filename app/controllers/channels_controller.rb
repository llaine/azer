class ChannelsController < ApplicationController
  before_action :require_login
  before_action :set_channel, only: [:edit, :update, :destroy]

  # GET /channels
  # GET /channels.json
  def index
    # Loading the channel linked to the offer of the current users
    @channels = current_user_channels
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    @channel = current_user_channels.includes(:messages).includes(messages: :user).where(id: params[:id]).first
    @message = Message.new
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit
  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = current_user.channels.build(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def current_user_channels
      Channel.where(offer_id: current_user.offers.pluck(:id))
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = current_user_channels.where(id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def channel_params
      params.require(:channel).permit(:title, :user_id)
    end
end
