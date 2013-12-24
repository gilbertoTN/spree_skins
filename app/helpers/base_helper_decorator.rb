Spree::BaseHelper.class_eval do
  def link_to_cart_own_style
    return "" if current_spree_page?(spree.cart_path)

    text = text ? h(text) : Spree.t('shopping_cart')
    css_class = nil

    if current_order.nil? or current_order.item_count.zero?
      text = "#{text}: (#{Spree.t('empty')})"
      css_class = 'empty'
    else
      text = "<i class='carticon'></i>#{text}: <span class='label label-success font14'>#{current_order.item_count} #{Spree.t(:item)} </span>- #{current_order.display_total.to_html}<b class='caret'></b>".html_safe
      css_class = 'full'
    end

    link_to text, spree.cart_path, :class => "dropdown-toggle"
  end
end
