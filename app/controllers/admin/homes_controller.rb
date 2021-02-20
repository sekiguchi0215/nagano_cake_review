class Admin::HomesController < ApplicationController
	before_action :authenticate_admin!

	def top
		@count = Order.ordered_today.count
	end

	def search
		@model = params["search"]["model"]
		@content = params["search"]["content"]
		@method = params["search"]["method"]
		@result = search_for(@method, @content, @method)
	end

	private

	def search_for(model, content, method)
	end
end
