class ProductMailer < ApplicationMailer
	def new_product_list_email
    @product_list = params[:product_list]

    mail(to: "spcbntraders@gmail.com", subject: "New products are added!")
  end

end
