# self.most_revenue(n) returns the top n products instances ranked by total revenue

module FarMar
  class Product
    # assign path to csv file as a constant.
    PRODUCT_FILE = PROJECT_ROOT.join('support/products.csv')


    #----------------------------------------------------------------------
    # INSTANCE METHODS


    attr_reader :id, :name, :vendor_id


    def initialize(product_array)
      # variable to display helpful hint when new Product is not created, because input is not valid.
      error_example = "A valid product array has three items: an id number, a product name, and a vendor id number.\nExample product array: [\"498\", \"Unhappy Carrots\", \"76\"]."

      # verify array & verify right number of items.
      unless (product_array.class == Array) && (product_array.length == 3)
        puts "To create a new Product, please enter an array with three items.\n#{ error_example }"
        return
      end

      # verifying data type of items.
      product_array.each do |product|
        unless product.class == String
          puts "To create a new Product, please enter an array of three string items.\n#{ error_example }"
          return
        end
      end

      # verify that the id numbers in product_array[0] & product_array[2] are numbers inside strings.
      unless (product_array[0].to_i > 0) && (product_array[2].to_i > 0)
        puts "Please enter an integer value inside a string for numeric values.\n#{ error_example }"
        return
      end

      # if interpreter gets this far, input is valid. so assign values and create new instance.
      @id        = product_array[0].to_i
      @name      = product_array[1]
      @vendor_id = product_array[2].to_i
    end


    # number_of_sales - returns the number of times this product has been sold.
    def number_of_sales
      return self.sales.count
    end


    # sales - returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
    def sales
      # grabs all sales from class method .all.
      all_sales = Sale.all
      matching_sales = []

      # search through all sales to find where product's id number matches sale's id number.
      # then, push matching sales into array.
      all_sales.each do |sale|
        if sale.product_id == @id
          matching_sales.push(sale)
        end
      end

      return matching_sales
    end


    # vendor - returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field.
    def vendor
      return Vendor.find(@vendor_id)
    end


    #----------------------------------------------------------------------
    # CLASS METHODS


    # self.all - returns all rows of the CSV file as objects.
    def self.all
      products = []

      # opens and reads product file, grabbing each line as a single product.
      # then, creates product instance and pushes into product array.
      CSV.read(PRODUCT_FILE).each do |product|
        products.push(Product.new(product))
      end

      return products
    end


    # self.by_vendor(vendor_id) - returns all of the products with the given vendor_id
    # find all the products sold by the given vendor id.
    def self.by_vendor(vendor_id)
      matching_products = []

      # opens and reads product file, grabbing each line as a single product.
      # if the given vendor id matches the product's id, pushes that product instance into array.
      CSV.read(PRODUCT_FILE).each do |product|
        if vendor_id == product[2].to_i
          matching_products.push(Product.new(product))
        end
      end

      return matching_products
    end


    # self.find(id) - returns the row where the ID field matches the argument.
    def self.find(id)
      # opens and reads product file, grabbing each line as a single product.
      # if the given id matches the product's id, creates and returns that product instance.
      CSV.read(PRODUCT_FILE).each do |product|
        if id == product[0].to_i
          return Product.new(product)
        end
      end
    end
  end
end
