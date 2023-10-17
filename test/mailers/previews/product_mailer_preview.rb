# Preview all emails at http://localhost:3000/rails/mailers/product_mailer
class ProductMailerPreview < ActionMailer::Preview

	def new_product_list_email
    product = Product.new(name: "manga", price: "30")
		ProductMailer.with(product_list: product).new_product_list_email
    
  end


end
