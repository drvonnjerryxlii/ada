module FarMar
  class Vendor
    # assign path to csv file as a constant.
    VENDOR_FILE = PROJECT_ROOT.join('support/vendors.csv')


    #----------------------------------------------------------------------
    # INSTANCE METHODS


    attr_reader :id, :name, :no_of_employees, :market_id


    def initialize(vendor_array)
      # variable to display helpful hint when new Vendor is not created, because input is not valid.
      error_example = "A valid vendor array has four items: an id number, a name, a number of employees, and a market id number.\nExample vendor array: [\"3\", \"Breitenberg Inc\", \"5\", \"1\"]."

      # verify array & verify right number of items.
      unless (vendor_array.class == Array) && (vendor_array.length == 4)
        puts "To create a new Vendor, please enter an array with four items.\n#{ error_example }"
        return
      end

      # verifying data type of items.
      vendor_array.each do |vendor|
        unless vendor.class == String
          puts "To create a new Vendor, please enter an array of four string items.\n#{ error_example }"
          return
        end
      end

      # verify that the id and employee numbers in vendor_array[0, 2, 3] are numbers inside strings.
      unless (vendor_array[0].to_i > 0) && (vendor_array[2].to_i > 0) && (vendor_array[3].to_i > 0)
        puts "Please enter an integer value inside a string for numeric values.\n#{ error_example }"
        return
      end

      # if interpreter gets this far, input is valid. so assign values and create new instance.
      @id              = vendor_array[0].to_i
      @name            = vendor_array[1]
      @no_of_employees = vendor_array[2].to_i
      @market_id       = vendor_array[3].to_i
    end


    # market - returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field.
    def market
      return Market.find(@market_id)
    end


    # products - returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
    def products
      # grabs all products from Product class method .all.
      all_products = Product.all
      matching_products = []

      # search through all products to find where vendor's id number matches product's id number.
      # then, push matching products into array.
      all_products.each do |product|
        if product.vendor_id == @id
          matching_products.push(product)
        end
      end

      return matching_products
    end


    # revenue - returns the the sum of all of the vendor's sales (in cents).
    def revenue
      # grabs all sales from instance method .sales.
      all_sales = self.sales
      total_revenue = 0

      # loop through sales, adding amount of sales to total revenue.
      all_sales.each do |sale|
        total_revenue += sale.amount
      end

      return total_revenue
    end


    # sales - returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
    def sales
      # grabs all sales from Sales class method .all.
      all_sales = Sale.all
      matching_sales = []

      # search through all sales to find where vendor's id number matches sale's id number.
      # then, push matching sales into array.
      all_sales.each do |sale|
        if sale.vendor_id == @id
          matching_sales.push(sale)
        end
      end

      return matching_sales
    end


    #----------------------------------------------------------------------
    # CLASS METHODS


    # self.all - returns all rows of the CSV file as objects.
    def self.all
      vendors = []

      # opens and reads vendor file, grabbing each line as a single vendor.
      # then, creates vendor instance and pushes into vendor array.
      CSV.read(VENDOR_FILE).each do |vendor|
        vendors.push(Vendor.new(vendor))
      end

      return vendors
    end


    # self.by_market(market_id) - returns all of the vendors with the given market_id
    def self.by_market(market_id)
      matching_vendors = []

      # opens and reads vendor file, grabbing each line as a single vendor.
      # if the given market id matches the vendor id, pushes that market instance into array.
      CSV.read(VENDOR_FILE).each do |vendor|
        if market_id == vendor[3].to_i
          matching_vendors.push(Vendor.new(vendor))
        end
      end

      return matching_vendors
    end


    # self.find(id) - returns the row where the ID field matches the argument.
    def self.find(id)
      # opens and reads vendor file, grabbing each line as a single vendor.
      # if the given id matches the vendor's id, creates and returns that vendor instance.
      CSV.read(VENDOR_FILE).each do |vendor|
        if id == vendor[0].to_i
          return Vendor.new(vendor)
        end
      end
    end
  end
end
