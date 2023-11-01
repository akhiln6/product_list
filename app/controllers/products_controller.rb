class ProductsController < ApplicationController
 
  def index
    @products = Product.all
  
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @products = Product.all
    @product = current_user.products.new(product_params)
    authorize @product
    if @product.save
      redirect_to root_path, notice: 'Product was successfully created.'
      ProductMailer.with(product_list: @product, product_lists: @products).new_product_list_email.deliver_now
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    original_product = @product.dup
    authorize @product
    if @product.update(product_params)
      redirect_to root_path, notice: 'Product was successfully updated.'
      ProductMailer.with(product_list: @product, original_products: original_product).update_product_list_email.deliver_now
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    authorize @product
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  
  private
 
  def product_params
    params.require(:product).permit(:name, :price)
  end


end
