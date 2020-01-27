class AdvancedSearchController < ApplicationController
    def index
        @results = Array.new
        @type, @category, @provider = '', '',''
        if params[:advanced_search]
            @type = params[:advanced_search][:type]
            @category = params[:advanced_search][:categories_advanced]
            @provider = params[:advanced_search][:providers]
            if @type == 'products'
                terms = params[:advanced_search][:terms] || ''
                products = Product.all.global_search("#{terms}").to_a
                products = Product.actives.merge products

                unless @category.blank?
                    products = products.where category_id: @category
                end

                unless @provider.blank?
                    products = products.where provider_id: @provider
                end

                if !@provider.blank? && !@category.blank?
                    products = products.where 'provider_id = ? AND category_id = ?', @provider, @category
                end

                @results = products
            elsif @type == 'providers'
                providers = Provider.actives

                unless @provider.blank?
                    providers = providers.where id: @provider
                end

                if !@category.blank? && @provider.blank?
                    providers = providers.joins(:products).where(products: { category_id: @category })
                end

                @results = providers
            end
        end
        @results
    end
end