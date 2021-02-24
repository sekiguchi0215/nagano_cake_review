class Public::CustomersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_current_customer

	def show
  	end

  	def edit
  	end

  	def update
  		if @customer.update(customer_params)
  			redirect_to mypage_path, notice: "会員情報の更新が完了しました。"
  		else
  			render :edit
  		end
  	end

  	def unsubscribe # 「登録」(subscribe)という単語の否定。
  	end

  	def withdraw # 「取り下げる」や「撤退」という意味。つまりは、登録解除のこと。
  		@customer.update(is_active: false)
  		reset_session # すべてのセッション情報を削除する。
  		redirect_to root_path
  	end

  	private

  	def set_current_customer
  		@customer = current_customer
  	end

  	def customer_params
  		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  	end
end
