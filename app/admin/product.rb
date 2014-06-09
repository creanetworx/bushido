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
    permit_params :article_id, :title, :description, :price, :featured, :available, :image_file_name, :square

    # Displayed columns
    index do
    selectable_column
        column :article,  :sortable => :article
        column :title,    :sortable => :title
        column :description
    # Currency helper
        column :price, :sortable => :price do |cur|
            number_to_currency cur.price, locale: :ru
        end
        column :featured
        column :available
    #   column :image_file_name
        actions
    end

    # Product details
    show do
        panel "Product Details" do
            attributes_table_for product do
                row("Article")           { link_to product.article }
                row("Title")             { product.title }
                row("Description")       { product.description }
                row("Price")             { product.price }
                row("Featured")          { product.featured }
                row("Available on")      { product.available }
                row("Image")             { image_tag("products/" + product.image_file_name) }
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
    # Filters for each column within "description, image_file_name"
    filter :article,      :as => :select
    filter :title,        :as => :select               # :check_boxes (for checkboxes)
    filter :price,        :as => :select
    filter :available,    :as => :select
    filter :featured,     :as => :check_boxes
    filter :square,       :as => :text
end
