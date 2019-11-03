module ProvidersHelper
    def provider_image provider
        unless provider.logo_attachment
            image_tag 'no-img.jpg', class: 'img-fluid'
        else
            image_tag provider.logo, class: 'img-fluid'
        end
    end
end
