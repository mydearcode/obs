class ProductsController < ApplicationController
  before_action :authenticate_request

  before_action :set_product, only: %i[ show update destroy send_review ]

  # GET /products
  def index
    @products = Product.all
    render json: @products
  end

  # GET /products/1
  def show 
    @reviews = @product.reviews   
    @metrics = Category.find_by(id: @product.category_id).metrics
    @reviews.each do |review|
     @review_responses = review.review_responses
    end
    
    render json: {product: @product, metrics: @metrics, reviews: @reviews}
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    
    if @product.save
      @metrics = Category.find_by(id: @product.category_id).metrics
      render json: {product: @product, metrics: @metrics}, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :info, :of_link, :buy_link, :category_id, :brand_id, :user_id)
    end
    
end
