module ApplicationHelper

  def add_to_cart product, opt = {}
    html_class = "btn btn-danger add-to-cart-btn"
    html_class += " #{opt[:html_class]}" unless opt[:html_class].blank?

    link_to "<i class='fa fa-spinner'></i> 加入购物车".html_safe, shopping_carts_path, class: html_class, 'data-product-id': product.id
  end

end
