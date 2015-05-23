module FarMar
  class Market
    # assign path to csv file as a constant.
    MARKET_FILE = PROJECT_ROOT.join('support/markets.csv')


    #----------------------------------------------------------------------
    # INSTANCE METHODS


    attr_reader :id, :name, :address, :city, :county, :state, :zip


    def initialize(market_array)
      # variable to display helpful hint when new Market is not created, because input is not valid.
      error_example = "Example market array: [\"1\", \"People's Co-op Farmers Market\", \"30th and Burnside\", \"Portland\", \"Multnomah\", \"Oregon\", \"97202\"]."

      # verify array & verify right number of items.
      unless (market_array.class == Array) && (market_array.length == 7)
        puts "To create a new Market, please enter an array with seven items.\n#{ error_example }"
        return
      end

      # verifying data type of items.
      market_array.each do |item|
        # some of the market data is missing zip codes. :(  "" will return nil.
        unless (item.class == String) || (item == nil)
          puts "To create a new Market, please enter an array of seven string items.\n#{ error_example }"
          return
        end
      end

      # verify that the id number in market_array[0] is a number inside a string.
      unless (market_array[0].to_i > 0)
        puts "Please enter an integer value inside a string for the market id number.\n#{ error_example }"
        return
      end

      # if interpreter gets this far, input is valid. so assign values and create new instance.
      @id      = market_array[0].to_i
      @name    = market_array[1]
      @address = market_array[2]
      @city    = market_array[3]
      @county  = market_array[4]
      @state   = market_array[5]
      @zip     = market_array[6]
    end


    # products returns a collection of FarMar::Product instances that are associated to the market through the FarMar::Vendor class.
    def products
      # grabs all associated vendors from instance method .vendors.
      associated_vendors = self.vendors
      matching_products = []

      # loop through associated vendors and call the .products method on each vendor.
      # push the resulting product instances into the matching products array.
      associated_vendors.each do |vendor|
        # the result of vendor.products is an array, so this creates nested arrays.
        matching_products.push(vendor.products)
      end

      # use flatten to merge separate vendor product sets.
      matching_products.flatten!

      return matching_products
    end


    # vendors - returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
    def vendors
      # grabs all vendors from class method .all.
      all_vendors = Vendor.all
      matching_vendors = []

      # search through all vendors to find where market's id number matches vendor's id number.
      # then, push matching vendors into array.
      all_vendors.each do |vendor|
        if vendor.market_id == @id
          matching_vendors.push(vendor)
        end
      end

      return matching_vendors
    end


    #----------------------------------------------------------------------
    # CLASS METHODS


    # self.all - returns all rows of the CSV file as objects.
    def self.all
      markets = []

      # opens and reads market file, grabbing each line as a single market.
      # then, creates market instance and pushes into market array.
      CSV.read(MARKET_FILE).each do |market|
        markets.push(Market.new(market))
      end

      return markets
    end


    # self.find(id) - returns the row where the ID field matches the argument.
    def self.find(id)
      # opens and reads market file, grabbing each line as a single market.
      # if the given id matches the market's id, creates and returns that market instance.
      CSV.read(MARKET_FILE).each do |market|
        if id == market[0].to_i
          return Market.new(market)
        end
      end
    end


    # self.search(search_term) returns a collection of FarMar::Market instances where the market name or vendor name contain the search_term. For example FarMar::Market.search('school') would return 3 results, one being the market with id 75 (Fox School Farmers FarMar::Market).
    def self.search(search_term)
      # ensuring search term is a lowercase string.
      search_term = search_term.to_s.downcase

      # grabbing all markets from class method .all, which returns Market instances.
      all_markets = self.all
      matching_markets = []

      # looping through all markets.
      all_markets.each do |market|
        # if the market name includes the search term, it is pushed to the matching markets array.
        if market.name.to_s.downcase.include? search_term
          matching_markets.push(market)
        # if the market name does not include the search term, check the associated vendors.
        else
          # grabs the associated vendors by calling the instance method .vendors.
          associated_vendors = market.vendors

          # looping through the associated vendors.
          associated_vendors.each do |vendor|
            # if the vendor name includes search term, then push the market instance into matching markets array.
            if vendor.name.downcase.include? search_term
              matching_markets.push(vendor.market)
              break
            end
          end
        end
      end

      return matching_markets
    end
  end
end
