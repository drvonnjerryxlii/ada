module FarMar
  class Sale
    # assign path to csv file as a constant.
    SALE_FILE = PROJECT_ROOT.join('support/sales.csv')


    #----------------------------------------------------------------------
    # INSTANCE METHODS


    attr_reader :id, :amount, :purchase_time, :vendor_id, :product_id


    def initialize(sale_array)
      # variable to display helpful hint when new Sale is not created, because input is not valid.
      error_example = "A valid sale array has five items: an id number, an amount in cents, a purchase time, vendor id number, and product id number.\nExample sale array: [\"1\", \"9290\" ,\"2013-11-07 04:34:56 -0800\", \"1\", \"1\"]."

      # verify array & verify right number of items.
      unless (sale_array.class == Array) && (sale_array.length == 5)
        puts "To create a new Sale, please enter an array with five items.\n#{ error_example }"
        return
      end

      # verifying data type of items.
      sale_array.each do |sale|
        unless sale.class == String
          puts "To create a new Sale, please enter an array of five string items.\n#{ error_example }"
          return
        end
      end

      # verify that the numbers in sale_array[0, 1, 3, 4] are numbers inside strings.
      unless (sale_array[0].to_i > 0) && (sale_array[1].to_i > 0) && (sale_array[3].to_i > 0) && (sale_array[4].to_i > 0)
        puts "Please enter an integer value inside a string for numeric values.\n#{ error_example }"
        return
      end

      # if interpreter gets this far, input is valid. so assign values and create new instance.
      @id            = sale_array[0].to_i
      @amount        = sale_array[1].to_i
      # Time.parse will automatically throw an error if sale_array[2] is not valid.
      @purchase_time = Time.parse(sale_array[2])
      @vendor_id     = sale_array[3].to_i
      @product_id    = sale_array[4].to_i
    end


    # vendor - returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field.
    def vendor
      return Vendor.find(@vendor_id)
    end


    # product - returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field.
    def product
      return Product.find(@product_id)
    end


    #----------------------------------------------------------------------
    # CLASS METHODS


    # self.all - returns all rows of the CSV file as objects.
    def self.all
      sales = []

      # opens and reads sale file, grabbing each line as a single sale.
      # then, creates sale instance and pushes into sale array.
      CSV.read(SALE_FILE).each do |sale|
        sales.push(Sale.new(sale))
      end

      return sales
    end


    # self.between(beginning_time, end_time) - returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments.
    def self.between(beginning_time, end_time)
      matching_sales = []

      # convert input strings to time objects.
      # convert user input to string in case input is already a Time object.
      beginning_time = Time.parse(beginning_time.to_s)
      end_time = Time.parse(end_time.to_s)

      # opens and reads sale file, grabbing each line as a single sale.
      # if the sale time is between given starting and ending times,
      # then creates sale instance and pushes into matching sale array.
      CSV.read(SALE_FILE).each do |sale|
        purchase_time = Time.parse(sale[2])
        if (beginning_time < purchase_time) && (purchase_time < end_time)
          matching_sales.push(Sale.new(sale))
        end
      end

      return matching_sales
    end


    # self.find(id) - returns the row where the ID field matches the argument.
    def self.find(id)
      # opens and reads sale file, grabbing each line as a single sale.
      # if the given id matches the sale's id, creates and returns that sale instance.
      CSV.read(SALE_FILE).each do |sale|
        if id == sale[0].to_i
          return Sale.new(sale)
        end
      end
    end
  end
end
