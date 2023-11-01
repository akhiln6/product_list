class ProductMailer < ApplicationMailer
	def new_product_list_email
    @product_list = params[:product_list]
    @product_lists = params[:product_lists]
    mail(to: "spcbntraders@gmail.com", subject: "New products are added!")
  end

  def update_product_list_email
    @product_list = params[:product_list]
    @product_lists = params[:original_products]
    mail(to: "spcbntraders@gmail.com", subject: "products price updated!")
  end


end
