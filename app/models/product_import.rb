class ProductImport
    include ActiveModel::Model
    require 'roo'
    require 'csv'
    attr_accessor :file, :provider_id

    def initialize attributes = {}
        attributes.each { |name, value| send("#{name}=", value) }
    end

    def import
        spreadsheet = open_spreadsheet
        header = spreadsheet.row 1
        header = Product.product_attributes_dictionary header
        (2..spreadsheet.last_row).each do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            product = Product.new
            product.provider_id = provider_id
            product.category_id = Category.find_by_description(row[:category_name]).id
            product.attributes = row.to_hash.except :category_name
            product.save!
        end
    end

    private 

    def open_spreadsheet
        case File.extname(file.original_filename)
        when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
        when '.xlsx' then Roo::Excelx.new(file.path)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end
end