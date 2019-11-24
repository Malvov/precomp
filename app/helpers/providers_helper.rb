module ProvidersHelper
    def provider_image provider
        unless provider.attachment
            image_tag 'no-img.jpg', class: 'img-fluid'
        else
            image_tag provider.attachment, class: 'img-fluid'
        end
    end
end
