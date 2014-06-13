class BucketProduct < ActiveRecord::Base
   belongs_to :bucket, polymorphic: true
   belongs_to :product
end
