ActiveAdmin.register Product, { :sort_order => :name_asc } do
    # Scopes
    scope :all, :default => true
    scope :available do |products|
        products.where("available < ?", Date.today)
    end
    scope :drafts do |products|
        products.where("available > ?", Date.today)
    end
    scope :featured_products do |products|
        products.where(:featured => true)
    end

    # Permitted parameters
    permit_params :article_id, :title, :description, :price, :featured, :available, :image_file_name, :square, :type_id

    # Displayed columns
    index do
    selectable_column
        column :article,  :sortable => :article
        column :title,    :sortable => :title
        column :type,    :sortable => :type
        column :description
    # Currency helper
        column :price, :sortable => :price do |cur|
            number_to_currency cur.price, locale: :ru
        end
        column :featured
        column :available
    #   column :image_file_name
        actions do |post|
          link_to "Add to cart", add_to_cart_path(post), :remote => true 
        end
    end

    # Product details
    show do
        panel "Product Details" do
            attributes_table_for product do
                row("Article")           { link_to product.article }
                row("Title")             { product.title }
                row("Type")             { product.type }
                row("Description")       { product.description }
                row("Price")             { number_to_currency product.price, locale: :ru  }
                row("Featured")          { product.featured }
                row("Available on")      { product.available }
                row("Image")             { image_tag("products/" + product.image_file_name) }
                row("Purchase")          { link_to("Add to cart",add_to_cart_path(product),:remote=>true ) }
            end
        end
    end

    # Sidebars
#   sidebar :product_stats, :only => :show do
#       attributes_table_for resource do
#          row("Total Sold")  { Order.find_with_product(resource).count }
#          row("Rubble Value"){ number_to_currency LineItem.where(:product_id => resource.id).sum(:price) }
#      end
#  end

#   sidebar :recent_orders, :only => :show do
#       Order.find_with_product(resource).limit(5).collect do |order|
#           auto_link(order)
#       end.join(content_tag("br")).html_safe
#   end
    collection_action :sold do
      article = Article.find(params[:article_id])
      @price = article.rub.to_i*params[:square].to_i
      render :layout => false
    end

    member_action :add_to_cart, :method => :get do
      product = Product.find(params[:id])
      bucket = BucketProduct.find_or_create_by(:product_id=>params[:id],:bucket_id=>current_admin_user.cart.id,:bucket_type=>current_admin_user.cart.class.to_s)
      render :layout => false
    end

    # Filters for each column within "description, image_file_name"
    filter :article,      :as => :select
    filter :type,         :as => :select
    filter :title,        :as => :select               # :check_boxes (for checkboxes)
    filter :price,        :as => :select
    filter :available,    :as => :select
    filter :featured,     :as => :check_boxes
    filter :square,       :as => :text
end
