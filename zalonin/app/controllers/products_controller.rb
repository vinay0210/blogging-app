class ProductsController < InheritedResources::Base
before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
def edit
  end

  # product /products
  # product /products.json
  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        format.html { redirect_to '/home/ecommerce', notice: 'product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
        format.js { }
    else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js{ }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to '/home/ecommerce', notice: 'product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to '/home/ecommerce', notice: 'product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private

    def product_params
      params.require(:product).permit(:name, :category, :price, :description, :quantity, :picture)
    end
end

