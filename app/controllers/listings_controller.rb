class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_vars, only: [:new, :create, :edit, :update]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]


  # GET /listings
  # GET /listings.json
  def index

    @q = Listing.ransack(params[:q])
    @listings = @q.result(distinct: true)
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @listing.brand,
            description: @listing.model,
            amount: @listing.price * 100,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @listing.id
            }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
        cancel_url: "#{root_url}listings"
    )

    @session_id = session.id
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.create(listing_params)
    
    if @listing.errors.any?
      render "new"
      else
      redirect_to listings_path
      end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:brand, :model, :colorway, :price, :condition, :description, :location_id, :size_id,:user_id,picture: [])
    end

    def set_vars
      @conditions = Listing.conditions.keys
      @locations = Location.all
      @sizes = Size.all
  end
end
