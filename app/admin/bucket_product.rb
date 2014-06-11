ActiveAdmin.register BucketProduct, { :sort_order => :id_asc } do
 # Permitted parameters
 permit_params :product_id, :bucket_id,:bucket_type

  
end